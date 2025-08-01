
#include "cmsis_os2.h"
#include "GUI.h"
#include "DIALOG.h"
#include "main.h"
#include <stdio.h>

#define ID_FRAMEWIN_0     (GUI_ID_USER + 0x00)
#define ID_BUTTON_0     (GUI_ID_USER + 0x01)
#define ID_CHECKBOX_0     (GUI_ID_USER + 0x02)
#define ID_TEXT_0     (GUI_ID_USER + 0x03)

extern int  GUI_VNC_X_StartServer(int, int);

/*----------------------------------------------------------------------------
 *      GUIThread: GUI Thread for Single-Task Execution Model
 *---------------------------------------------------------------------------*/
#define GUI_THREAD_STK_SZ    (4096U)

static void         GUIThread (void *argument);         /* thread function */
static osThreadId_t GUIThread_tid;                      /* thread id */
static uint64_t     GUIThread_stk[GUI_THREAD_STK_SZ/8]; /* thread stack */

static const osThreadAttr_t GUIThread_attr = {
  .stack_mem  = &GUIThread_stk[0],
  .stack_size = sizeof(GUIThread_stk),
  .priority   = osPriorityNormal
};

int Init_GUIThread (void) {

  GUIThread_tid = osThreadNew(GUIThread, NULL, &GUIThread_attr);
  if (GUIThread_tid == NULL) {
    return(-1);
  }

  return(0);
}

extern WM_HWIN CreateFramewin(void);

__NO_RETURN static void GUIThread (void *argument) {
  (void)argument;

  GUI_Init();           /* Initialize the Graphics Component */
	
	GUI_VNC_X_StartServer(0,0);

  /* Add GUI setup code here */
	WM_HWIN hWin = CreateFramewin();
	
	WM_HWIN hItem = WM_GetDialogItem(hWin, ID_TEXT_0);
  
	int time=0;
	  
  while (1) {
		if(HAL_GetTick() /1000 != time)
		{
			time=HAL_GetTick()/1000;
			char buffer[50];
			sprintf(buffer,"%d",time);
			TEXT_SetText(hItem,buffer);
		};
    
    /* All GUI related activities might only be called from here */
    GUI_TOUCH_Exec();             /* Execute Touchscreen support */
    GUI_Exec();         /* Execute all GUI jobs ... Return 0 if nothing was done. */
    GUI_X_ExecIdle();   /* Nothing left to do for the moment ... Idle processing */
  }
}
