/******************************************************************************
 * @file     vio_STM32F746G-DISCO.c
 * @brief    Virtual I/O implementation for board STM32F746G-DISCO
 * @version  V2.0.2
 * @date     26. September 2024
 ******************************************************************************/
/*
 * Copyright (c) 2020-2024 Arm Limited (or its affiliates).
 * All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*! \page vio_STM32F746G-DISCO Physical I/O Mapping

The table below lists the physical I/O mapping of this CMSIS-Driver VIO implementation.

| Virtual I/O   | Variable       | Board component      | Pin
|:--------------|:---------------|:---------------------|:------
| vioBUTTON0    | vioSignalIn.0  | USER button (B1)     | PI11
| vioLED0       | vioSignalOut.0 | LED (LD1)            | PI1
*/

#include "cmsis_vio.h"

#include "RTE_Components.h"                     // Component selection
#include CMSIS_device_header

#if !defined CMSIS_VOUT || !defined CMSIS_VIN
#include "GPIO_STM32.h"
#endif

// VIO input, output definitions
#ifndef VIO_VALUE_NUM
#define VIO_VALUE_NUM           5U              // Number of values
#endif

// VIO input, output variables
static uint32_t vioSignalIn             __USED; // Memory for incoming signal
static uint32_t vioSignalOut            __USED; // Memory for outgoing signal
static int32_t  vioValue[VIO_VALUE_NUM] __USED; // Memory for value used in vioGetValue/vioSetValue

#if !defined CMSIS_VOUT || !defined CMSIS_VIN

// VIO Active State
#define VIO_ACTIVE_LOW          0U
#define VIO_ACTIVE_HIGH         1U

typedef struct {
  uint32_t vioSignal;
  uint16_t pin;
  uint8_t  pullResistor;
  uint8_t  activeState;
} pinCfg_t;

#if !defined CMSIS_VOUT
// VOUT Configuration
static const pinCfg_t outputCfg[] = { vioLED0, GPIO_PIN_ID_PORTI(1), ARM_GPIO_PULL_NONE, VIO_ACTIVE_HIGH};
#endif

#if !defined CMSIS_VIN
// VIN Configuration
static const pinCfg_t inputCfg[] = {
//  signal,     pin,                   pull resistor,      active state
  { vioBUTTON0, GPIO_PIN_ID_PORTI(11), ARM_GPIO_PULL_NONE, VIO_ACTIVE_HIGH }
};
#endif

// External GPIO Driver
extern ARM_DRIVER_GPIO Driver_GPIO0;
static ARM_DRIVER_GPIO *pGPIODrv = &Driver_GPIO0;
#endif

// Initialize test input, output.
void vioInit (void) {
  uint32_t n;
#if !defined(CMSIS_VOUT) || !defined(CMSIS_VIN)
  ARM_GPIO_Pin_t pin;
#endif

  vioSignalIn  = 0U;
  vioSignalOut = 0U;

  for (n = 0U; n < VIO_VALUE_NUM; n++) {
    vioValue[n] = 0U;
  }

#if !defined CMSIS_VOUT
  for (n = 0U; n < (sizeof(outputCfg) / sizeof(pinCfg_t)); n++) {
    pin = (ARM_GPIO_Pin_t)outputCfg[n].pin;
    pGPIODrv->Setup(pin, NULL);
    pGPIODrv->SetOutputMode(pin, ARM_GPIO_PUSH_PULL);
    pGPIODrv->SetPullResistor(pin, outputCfg[n].pullResistor);
    pGPIODrv->SetDirection(pin, ARM_GPIO_OUTPUT);

    // Set initial pin state to inactive
    if (outputCfg[n].activeState == VIO_ACTIVE_HIGH) {
      pGPIODrv->SetOutput(pin, 0U);
    } else {
      pGPIODrv->SetOutput(pin, 1U);
    }
  }
#endif

#if !defined CMSIS_VIN
  for (n = 0U; n < (sizeof(inputCfg) / sizeof(pinCfg_t)); n++) {
    pin = (ARM_GPIO_Pin_t)inputCfg[n].pin;
    pGPIODrv->Setup(pin, NULL);
    pGPIODrv->SetPullResistor(pin, inputCfg[n].pullResistor);
    pGPIODrv->SetDirection(pin, ARM_GPIO_INPUT);
  }
#endif
}

// Set signal output.
void vioSetSignal (uint32_t mask, uint32_t signal) {
#if !defined CMSIS_VOUT
  ARM_GPIO_Pin_t pin;
  uint32_t pinValue, n;
#endif

  vioSignalOut &= ~mask;
  vioSignalOut |=  mask & signal;

#if !defined CMSIS_VOUT
  // Output signals to LEDs
  for (n = 0U; n < (sizeof(outputCfg) / sizeof(pinCfg_t)); n++) {
    pin = (ARM_GPIO_Pin_t)outputCfg[n].pin;
    if ((mask & outputCfg[n].vioSignal) != 0U) {
      if ((signal & outputCfg[n].vioSignal) != 0U) {
        pinValue = 1U;
      } else {
        pinValue = 0U;
      }
      if (pinValue == outputCfg[n].activeState) {
        pGPIODrv->SetOutput(pin, 1U);
      } else {
        pGPIODrv->SetOutput(pin, 0U);
      }
    }
  }
#endif
}

// Get signal input.
uint32_t vioGetSignal (uint32_t mask) {
  uint32_t signal;
#if !defined CMSIS_VIN
  ARM_GPIO_Pin_t pin;
  uint32_t pinValue, n;
#endif

#if !defined CMSIS_VIN
  // Get input signals from buttons
  for (n = 0U; n < (sizeof(inputCfg) / sizeof(pinCfg_t)); n++) {
    pin = (ARM_GPIO_Pin_t)inputCfg[n].pin;
    if ((mask & inputCfg[n].vioSignal) != 0U) {
      pinValue = pGPIODrv->GetInput(pin);
      if (pinValue == inputCfg[n].activeState) {
        vioSignalIn |=  inputCfg[n].vioSignal;
      } else {
        vioSignalIn &= ~inputCfg[n].vioSignal;
      }
    }
  }
#endif

  signal = vioSignalIn & mask;

  return signal;
}

// Set value output.
//   Note: vioAOUT not supported.
void vioSetValue (uint32_t id, int32_t value) {
  uint32_t index = id;
#if !defined CMSIS_VOUT
// Add user variables here:

#endif

  if (index >= VIO_VALUE_NUM) {
    return;                             /* return in case of out-of-range index */
  }

  vioValue[index] = value;

#if !defined CMSIS_VOUT
// Add user code here:

#endif
}

// Get value input.
//   Note: vioAIN not supported.
int32_t vioGetValue (uint32_t id) {
  uint32_t index = id;
  int32_t  value;
#if !defined CMSIS_VIN
// Add user variables here:

#endif

  if (index >= VIO_VALUE_NUM) {
    return 0U;                          /* return 0 in case of out-of-range index */
  }

#if !defined CMSIS_VIN
// Add user code here:

#endif

  value = vioValue[index];

  return value;
}
