cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT STM32F746G-DISCO-GUI_VNC-uvision+Target_1)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/STM32F746G-DISCO-GUI_VNC-uvision/Target_1")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(LD_SCRIPT "${SOLUTION_ROOT}/STM32F746G-DISCO-GUI_VNC-uvision_Target_1.sct")
set(LD_SCRIPT_PP ${LD_SCRIPT})

# Processor Options
set(CPU Cortex-M7)
set(FPU SP_FPU)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C ASM)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "STM32F746G-DISCO-GUI_VNC-uvision")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "${SOLUTION_ROOT}/."
    "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy"
    "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/CMSIS/Device/ST/STM32F7xx/Include"
    "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Inc"
    "${SOLUTION_ROOT}/STM32CubeMX/Target_1/MX_Device"
  >
  "${SOLUTION_ROOT}/RTE/_Target_1"
  "${SOLUTION_ROOT}/RTE/CMSIS"
  "${SOLUTION_ROOT}/RTE/Network"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Driver_STM32/1.2.0/Drivers"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Core/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/Driver/VIO/Include"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.2.0/CMSIS/RTOS2/Include"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware/8.0.0/Components/Network/Include"
  "${CMSIS_PACK_ROOT}/Keil/MDK-Middleware_Graphics/1.3.1/emWin/Include"
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    EMAC_DCACHE_MAINTENANCE=0
    USE_HAL_DRIVER
    STM32F746xx
    STM32F746xx
    _RTE_
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:${ASM_BYTE_ORDER}"
    "SHELL:-masm=auto"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-std=c11"
    "SHELL:-fno-rtti"
    "SHELL:-funsigned-char"
    "SHELL:-fshort-enums"
    "SHELL:-fshort-wchar"
    "SHELL:-ffunction-sections"
    "SHELL:-Wall"
    "SHELL:-Wextra"
    "SHELL:-Wno-packed"
    "SHELL:-Wno-reserved-id-macro"
    "SHELL:-Wno-unused-macros"
    "SHELL:-Wno-documentation-unknown-command"
    "SHELL:-Wno-documentation"
    "SHELL:-Wno-license-management"
    "SHELL:-Wno-parentheses-equality"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "debug" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "debug" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_Source_Group_1_retarget_stdio_c
  Group_Source_Group_1
  Group_CubeMX
  Group_STM32_HAL_Driver
  ARM_CMSIS_Driver_VIO_Custom_1_0_0
  ARM_CMSIS-Compiler_CORE_1_1_0
  ARM_CMSIS-Compiler_STDERR_Custom_1_1_0
  ARM_CMSIS-Compiler_STDIN_Custom_1_1_0
  ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0
  ARM_CMSIS_CORE_6_1_1
  ARM_CMSIS_OS_Tick_SysTick_1_0_5
  ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0
  Keil_CMSIS_Driver_Ethernet_MAC_3_1_0
  Keil_CMSIS_Driver_Ethernet_PHY_LAN8742A_1_3_0
  Keil_CMSIS_Driver_GPIO_1_2_0
  Keil_CMSIS_Driver_USART_3_0_0
  Keil_Device_CubeMX_1_0_0
  Keil_Network_MDK_CORE_8_0_0
  Keil_Network_MDK_Interface_ETH_8_0_0
  Keil_Network_MDK_Socket_BSD_8_0_0
  Keil_Network_MDK_Socket_TCP_8_0_0
  Keil_Network_MDK_Socket_UDP_8_0_0
  Segger_Graphics_MDK-Pro_CORE_6_32_3
  Segger_Graphics_MDK-Pro_Display_Interface_Template_6_32_3
  Segger_Graphics_MDK-Pro_Input_Device_Touchscreen_6_32_3
  Segger_Graphics_MDK-Pro_Tools_GUI_Builder_6_32_3
  Segger_Graphics_MDK-Pro_VNC_Server_6_32_3
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--map"
  "SHELL:--load_addr_map_info"
  "SHELL:--xref"
  "SHELL:--callgraph"
  "SHELL:--symbols"
  "SHELL:--info sizes"
  "SHELL:--info totals"
  "SHELL:--info unused"
  "SHELL:--info veneers"
  "SHELL:--strict"
  "SHELL:--summary_stderr"
  "SHELL:--info summarysizes"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})
