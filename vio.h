#define vioEXTLED0             (1U << 8)   ///< \ref vioSetSignal \a mask parameter: EXT LED 0 
#define vioEXTLED1             (1U << 9)   ///< \ref vioSetSignal \a mask parameter: EXT LED 1 
#define vioEXTLED2             (1U << 10)   ///< \ref vioSetSignal \a mask parameter: EXT LED 2 
#define vioEXTLED3             (1U << 11)   ///< \ref vioSetSignal \a mask parameter: EXT LED 3
#define vioEXTLED4             (1U << 12)   ///< \ref vioSetSignal \a mask parameter: EXT LED 4
#define vioEXTLED5             (1U << 13)   ///< \ref vioSetSignal \a mask parameter: EXT LED 5
#define vioEXTLED6             (1U << 14)   ///< \ref vioSetSignal \a mask parameter: EXT LED 6
#define vioEXTLED7             (1U << 15)   ///< \ref vioSetSignal \a mask parameter: EXT LED 7

#define vioEXTLEDon (0xFF00)
#define vioEXTLEDoff (0x00)

// vioGetSignal: mask values and return values
#define vioEXTBUTTON0          (1U << 9)   ///< \ref vioGetSignal \a mask parameter: EXT Push button 0
#define vioEXTBUTTON1          (1U << 10)   ///< \ref vioGetSignal \a mask parameter: EXT Push button 1
#define vioEXTBUTTON2          (1U << 11)   ///< \ref vioGetSignal \a mask parameter: EXT Push button 2
#define vioEXTBUTTON3          (1U << 12)   ///< \ref vioGetSignal \a mask parameter: EXT Push button 3

typedef void (*vioExtButton0Event_t)(void);

void vioRegisterExtButton0Event(vioExtButton0Event_t cb_event);