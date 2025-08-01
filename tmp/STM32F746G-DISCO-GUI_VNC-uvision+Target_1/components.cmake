# components.cmake

# component ARM::CMSIS Driver:VIO:Custom@1.0.0
add_library(ARM_CMSIS_Driver_VIO_Custom_1_0_0 INTERFACE)
target_include_directories(ARM_CMSIS_Driver_VIO_Custom_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/VIO/Include"
)
target_compile_definitions(ARM_CMSIS_Driver_VIO_Custom_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_Driver_VIO_Custom_1_0_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:CORE@1.1.0
add_library(ARM_CMSIS-Compiler_CORE_1_1_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/source/armcc/retarget_io.c"
)
target_include_directories(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDERR:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDIN:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDOUT:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include"
)
target_compile_definitions(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:CORE@6.1.1
add_library(ARM_CMSIS_CORE_6_1_1 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_1_1 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Core/Include"
)
target_compile_definitions(ARM_CMSIS_CORE_6_1_1 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_1_1 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:OS Tick:SysTick@1.0.5
add_library(ARM_CMSIS_OS_Tick_SysTick_1_0_5 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/RTOS2/Source/os_systick.c"
)
target_include_directories(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/RTOS2/Include"
)
target_compile_definitions(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:RTOS2:Keil RTX5&Source@5.9.0
add_library(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/GCC/irq_armv7m.S"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_delay.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_evflags.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_evr.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_kernel.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_lib.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_memory.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_mempool.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_msgqueue.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_mutex.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_semaphore.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_system.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_thread.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_timer.c"
  "${SOLUTION_ROOT}/RTE/CMSIS/RTX_Config.c"
)
target_include_directories(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/CMSIS"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/RTOS2/Include"
)
target_compile_definitions(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set_source_files_properties("${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/GCC/irq_armv7m.S" PROPERTIES
  COMPILE_DEFINITIONS "STM32F746xx;_RTE_"
)

# component Keil::CMSIS Driver:Ethernet MAC@3.1.0
add_library(Keil_CMSIS_Driver_Ethernet_MAC_3_1_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers/ETH_MAC_STM32.c"
)
target_include_directories(Keil_CMSIS_Driver_Ethernet_MAC_3_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_Ethernet_MAC_3_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_Ethernet_MAC_3_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_Ethernet_MAC_3_1_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:Ethernet PHY:LAN8742A@1.3.0
add_library(Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver/2.10.0/Ethernet_PHY/LAN8742A/PHY_LAN8742A.c"
)
target_include_directories(Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:GPIO@1.2.0
add_library(Keil_CMSIS_Driver_GPIO_1_2_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers/GPIO_STM32.c"
)
target_include_directories(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_GPIO_1_2_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::CMSIS Driver:USART@3.0.0
add_library(Keil_CMSIS_Driver_USART_3_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers/USART_STM32.c"
)
target_include_directories(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
)
target_compile_definitions(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_CMSIS_Driver_USART_3_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:CubeMX@1.0.0
add_library(Keil_Device_CubeMX_1_0_0 INTERFACE)
target_include_directories(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Keil_Device_CubeMX_1_0_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(Keil_Device_CubeMX_1_0_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Network&MDK:CORE@8.0.0
add_library(Keil_Network_MDK_CORE_8_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_addr.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_arp.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_base64.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_common.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_config.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_debug.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_dhcp6_client.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_dhcp_client.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_icmp.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_icmp6.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_igmp.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ip4.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ip4_frag.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ip6.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ip6_frag.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_loopback.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_md5.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_mem.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_mld.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_nbns_client.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ndp.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_ping_core.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_sys.c"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_version.c"
)
target_include_directories(Keil_Network_MDK_CORE_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/Network"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Include"
)
target_compile_definitions(Keil_Network_MDK_CORE_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Network_MDK_CORE_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Network_MDK_CORE_8_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Network&MDK:Interface:ETH@8.0.0
add_library(Keil_Network_MDK_Interface_ETH_8_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_eth.c"
)
target_include_directories(Keil_Network_MDK_Interface_ETH_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/Network"
)
target_compile_definitions(Keil_Network_MDK_Interface_ETH_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Network_MDK_Interface_ETH_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Network_MDK_Interface_ETH_8_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Network&MDK:Socket:BSD@8.0.0
add_library(Keil_Network_MDK_Socket_BSD_8_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_bsd.c"
)
target_include_directories(Keil_Network_MDK_Socket_BSD_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/Network"
)
target_compile_definitions(Keil_Network_MDK_Socket_BSD_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Network_MDK_Socket_BSD_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Network_MDK_Socket_BSD_8_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Network&MDK:Socket:TCP@8.0.0
add_library(Keil_Network_MDK_Socket_TCP_8_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_tcp.c"
)
target_include_directories(Keil_Network_MDK_Socket_TCP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/Network"
)
target_compile_definitions(Keil_Network_MDK_Socket_TCP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Network_MDK_Socket_TCP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Network_MDK_Socket_TCP_8_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Network&MDK:Socket:UDP@8.0.0
add_library(Keil_Network_MDK_Socket_UDP_8_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Source/net_udp.c"
)
target_include_directories(Keil_Network_MDK_Socket_UDP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${SOLUTION_ROOT}/RTE/Network"
)
target_compile_definitions(Keil_Network_MDK_Socket_UDP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Network_MDK_Socket_UDP_8_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Network_MDK_Socket_UDP_8_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Segger::Graphics&MDK-Pro:CORE@6.32.3
add_library(Segger_Graphics_MDK-Pro_CORE_6_32_3 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware_Graphics/1.3.1/emWin/Sample/GUI_X/GUI_X_RTE.c"
  "${SOLUTION_ROOT}/RTE/Graphics/GUIConf.c"
)
target_include_directories(Segger_Graphics_MDK-Pro_CORE_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware_Graphics/1.3.1/emWin/Include"
)
target_compile_definitions(Segger_Graphics_MDK-Pro_CORE_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Segger_Graphics_MDK-Pro_CORE_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Segger_Graphics_MDK-Pro_CORE_6_32_3 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
  ${CMSIS_PACK_ROOT}/Keil/MDK-Middleware_Graphics/1.3.1/emWin/Lib/ARM/GUI_CM4F_L.lib
)

# component Segger::Graphics&MDK-Pro:Display:Interface Template@6.32.3
add_library(Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3 OBJECT
  "${SOLUTION_ROOT}/RTE/Graphics/LCDConf.c"
)
target_include_directories(Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Segger::Graphics&MDK-Pro:Input Device:Touchscreen@6.32.3
add_library(Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware_Graphics/1.3.1/emWin/Sample/GUI_X/GUI_X_Touch.c"
)
target_include_directories(Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Segger::Graphics&MDK-Pro:Tools:GUI Builder@6.32.3
add_library(Segger_Graphics_MDK-Pro_Tools_GUI_Builder_6_32_3 INTERFACE)
target_include_directories(Segger_Graphics_MDK-Pro_Tools_GUI_Builder_6_32_3 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Segger_Graphics_MDK-Pro_Tools_GUI_Builder_6_32_3 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(Segger_Graphics_MDK-Pro_Tools_GUI_Builder_6_32_3 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component Segger::Graphics&MDK-Pro:VNC Server@6.32.3
add_library(Segger_Graphics_MDK-Pro_VNC_Server_6_32_3 OBJECT
  "${SOLUTION_ROOT}/RTE/Graphics/GUI_VNC_X_StartServerRTE.c"
)
target_include_directories(Segger_Graphics_MDK-Pro_VNC_Server_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Segger_Graphics_MDK-Pro_VNC_Server_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Segger_Graphics_MDK-Pro_VNC_Server_6_32_3 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Segger_Graphics_MDK-Pro_VNC_Server_6_32_3 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
