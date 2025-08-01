# groups.cmake

# group Source Group 1
add_library(Group_Source_Group_1 OBJECT
  "${SOLUTION_ROOT}/Blinky.c"
  "${SOLUTION_ROOT}/vio.c"
  "${SOLUTION_ROOT}/GUI_SingleThread.c"
  "${SOLUTION_ROOT}/FramewinDLG.c"
  "${SOLUTION_ROOT}/LCD_X.c"
  "${SOLUTION_ROOT}/Touch_746G_Discovery.c"
  "${SOLUTION_ROOT}/stm32746g_discovery_ts.c"
  "${SOLUTION_ROOT}/ft5336.c"
  "${SOLUTION_ROOT}/stm32746g_discovery.c"
)
target_include_directories(Group_Source_Group_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Source_Group_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Source_Group_1_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Source_Group_1_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Source_Group_1 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Source_Group_1 PUBLIC
  Group_Source_Group_1_ABSTRACTIONS
)

# file retarget_stdio.c
add_library(Group_Source_Group_1_retarget_stdio_c OBJECT
  "${SOLUTION_ROOT}/retarget_stdio.c"
)
target_include_directories(Group_Source_Group_1_retarget_stdio_c PUBLIC
  $<TARGET_PROPERTY:Group_Source_Group_1,INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Source_Group_1_retarget_stdio_c PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    RETARGET_STDIO_UART=1
  >
  $<TARGET_PROPERTY:Group_Source_Group_1,INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Group_Source_Group_1_retarget_stdio_c PUBLIC
  $<TARGET_PROPERTY:Group_Source_Group_1,INTERFACE_COMPILE_OPTIONS>
)
set_source_files_properties("${SOLUTION_ROOT}/retarget_stdio.c" PROPERTIES
  COMPILE_OPTIONS ""
)

# group CubeMX
add_library(Group_CubeMX OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/MDK-ARM/startup_stm32f746xx.s"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Src/main.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Src/stm32f7xx_it.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Src/stm32f7xx_hal_msp.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Src/stm32f7xx_hal_timebase_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Src/system_stm32f7xx.c"
)
target_include_directories(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CubeMX_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CubeMX_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CubeMX PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CubeMX PUBLIC
  Group_CubeMX_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  STM32F746xx
  _RTE_
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/MDK-ARM/startup_stm32f746xx.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# group STM32 HAL Driver
add_library(Group_STM32_HAL_Driver OBJECT
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_tim_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_adc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_flash_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_i2c_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_exti.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_crc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_crc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dcmi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dcmi_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma2d.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_eth.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_fmc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_nor.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sram.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_nand.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sdram.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_ltdc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_ltdc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dsi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_qspi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rtc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rtc_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_sdmmc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sd.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_mmc.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_spdifrx.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_spi.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_spi_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart_ex.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_hcd.c"
  "${SOLUTION_ROOT}/STM32CubeMX/Target_1/STM32CubeMX/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_usb.c"
)
target_include_directories(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_STM32_HAL_Driver_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_STM32_HAL_Driver PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_STM32_HAL_Driver PUBLIC
  Group_STM32_HAL_Driver_ABSTRACTIONS
)
