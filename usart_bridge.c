#include "Driver_USART.h"

// Assume we want to bridge USART6 <-> USART1
extern ARM_DRIVER_USART Driver_USART1;
extern ARM_DRIVER_USART Driver_USART6;

static ARM_DRIVER_USART *usart_src = &Driver_USART6;
static ARM_DRIVER_USART *usart_dst = &Driver_USART1;

// RX buffer (1-byte each side)
static uint8_t rx_buf_src[1];
static uint8_t rx_buf_dst[1];

// --- Small ring buffers for TX ---
#define BUF_SIZE 64   // adjust as needed

static uint8_t tx_buf_src[BUF_SIZE];  // buffer for USART1 -> USART6
static uint8_t tx_buf_dst[BUF_SIZE];  // buffer for USART6 -> USART1

static volatile uint16_t head_src = 0, tail_src = 0;
static volatile uint16_t head_dst = 0, tail_dst = 0;

static volatile uint8_t tx_active_src = 0;
static volatile uint8_t tx_active_dst = 0;

// Forward declaration
static void USART_Callback_src(uint32_t event);
static void USART_Callback_dst(uint32_t event);

// --- Helpers for ring buffer transmit ---
static void start_tx_src(void) {
    if (!tx_active_src && head_src != tail_src) {
        tx_active_src = 1;
        usart_src->Send(&tx_buf_src[tail_src], 1);  // send directly from buffer
        tail_src++;
        if (tail_src >= BUF_SIZE) tail_src = 0;
    }
}

static void start_tx_dst(void) {
    if (!tx_active_dst && head_dst != tail_dst) {
        tx_active_dst = 1;
        usart_dst->Send(&tx_buf_dst[tail_dst], 1);  // send directly from buffer
        tail_dst++;
        if (tail_dst >= BUF_SIZE) tail_dst = 0;
    }
}

// --- Init function ---
void usart_bridge_init(void) {
    // Init USART6 (src)
    usart_src->Initialize(USART_Callback_src);
    usart_src->PowerControl(ARM_POWER_FULL);
    usart_src->Control(ARM_USART_MODE_ASYNCHRONOUS |
                       ARM_USART_DATA_BITS_8 |
                       ARM_USART_PARITY_NONE |
                       ARM_USART_STOP_BITS_1 |
                       ARM_USART_FLOW_CONTROL_NONE,
                       115200);
    usart_src->Control(ARM_USART_CONTROL_RX, 1);
    usart_src->Control(ARM_USART_CONTROL_TX, 1);

    // Init USART1 (dst)
    usart_dst->Initialize(USART_Callback_dst);
    usart_dst->PowerControl(ARM_POWER_FULL);
    usart_dst->Control(ARM_USART_MODE_ASYNCHRONOUS |
                       ARM_USART_DATA_BITS_8 |
                       ARM_USART_PARITY_NONE |
                       ARM_USART_STOP_BITS_1 |
                       ARM_USART_FLOW_CONTROL_NONE,
                       115200);
    usart_dst->Control(ARM_USART_CONTROL_RX, 1);
    usart_dst->Control(ARM_USART_CONTROL_TX, 1);

    // Start first receive on both ends
    usart_src->Receive(rx_buf_src, 1);
    usart_dst->Receive(rx_buf_dst, 1);
}

// --- Callback ISR for source USART6 (to USART1) ---
static void USART_Callback_src(uint32_t event) {
    if (event & ARM_USART_EVENT_RECEIVE_COMPLETE) {
        // put into dst TX buffer
        tx_buf_dst[head_dst++] = rx_buf_src[0];
        if (head_dst >= BUF_SIZE) head_dst = 0;

        start_tx_dst();  // kick TX on USART1
        usart_src->Receive(rx_buf_src, 1);  // re-arm reception
    }

    if (event & ARM_USART_EVENT_SEND_COMPLETE) {
        tx_active_src = 0;
        start_tx_src();  // continue if more pending
    }
}

// --- Callback ISR for destination USART1 (to USART6) ---
static void USART_Callback_dst(uint32_t event) {
    if (event & ARM_USART_EVENT_RECEIVE_COMPLETE) {
        // put into src TX buffer
        tx_buf_src[head_src++] = rx_buf_dst[0];
        if (head_src >= BUF_SIZE) head_src = 0;

        start_tx_src();  // kick TX on USART6
        usart_dst->Receive(rx_buf_dst, 1);  // re-arm reception
    }

    if (event & ARM_USART_EVENT_SEND_COMPLETE) {
        tx_active_dst = 0;
        start_tx_dst();  // continue if more pending
    }
}
