#include "cmsis_os2.h"                          // CMSIS RTOS header file
#include "app_bluenrg_ms.h" 
#include <stdio.h>

/*----------------------------------------------------------------------------
 *      Thread 1 'Thread_Name': Sample thread
 *---------------------------------------------------------------------------*/
 
osThreadId_t tid_BluetoothThread;                        // thread id
 
void BluetoothThread (void *argument);                   // thread function
 
int Init_BluetoothThread (void) {
 
  tid_BluetoothThread = osThreadNew(BluetoothThread, NULL, NULL);
  if (tid_BluetoothThread == NULL) {
    return(-1);
  }
 
  return(0);
}
 
void BluetoothThread (void *argument) {
	
	printf("Init in bluetooth thread\n");
	MX_BlueNRG_MS_Init();
  
  while (1) {
    ; // Insert thread code here...
		MX_BlueNRG_MS_Process();
    osThreadYield();                            // suspend thread
  }
}
