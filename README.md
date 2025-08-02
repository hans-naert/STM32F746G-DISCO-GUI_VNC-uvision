# GUI_VNC example project & Bluetooth

## Start from project with emWin en VNC

![VNC - Real VNC](doc/VNC.png)

*Image 1: VNC - Real VNC*

![Serial Port](doc/serial_port.png)

*Image 2: Serial Port - Putty*

## Add bluetooth

### CubeMX

#### Pins

| PIN  | NAME        | FUNCTION |
|------|-------------|----------|
| PA0  | IRQ         | EXTI0    |
| PI1  | SPI2_SCK    | SPI2     |
| PB14 | SPI2_MISO   | SPI2     |
| PB15 | SPI2_MOSI   | SPI2     |
| PI3  | RST         | GPIO_OUT |
| PF10 | CSN         | GPIO_OUT |
| PI11 | PUSH_BUTTON | EXTI11   |
| PA9  | USART1_TX   | USART    |
| PB7  | USART1_RX   | USART    |
| PA15 | EXT_LED7    | GPIO_OUT |
| PA8  | EXT_LED8    | GPIO_OUT |

#### SPI2 Configuration

<img src="./media/image1.png" alt="A screenshot of a computer Description automatically generated" />

#### Bluetooth

Add Bluetooth firmware, kies “template” voor “hci-tl-interface”

<img src="./media/image2.png" alt="A screenshot of a computer Description automatically generated" />

<img src="./media/image3.png" alt="A screenshot of a computer Description automatically generated" />

Do not call Bluetooth init and process functions:

<img src="./media/image4.png" alt="A screenshot of a computer AI-generated content may be incorrect." />

### Keil

### Source

Pas de uvprojx file aan door de verschillende “Group” elementen over te
nemen uit het project ".\STM32CubeMX\Target_1\STM32CubeMX\MDK-ARM\STM32CubeMX.uvprojx"

<img src="./media/source.png" alt="A screenshot of a computer program Description automatically generated" />

