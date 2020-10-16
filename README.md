[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
Stm32flash in a container
=========================

This is an alpine linux based docker image, which contains the stm32flash
flashing tool.

Usage
=====

If your serial port adaptor is available at ```/dev/ttyUSB0```, and if your
firmware file is present in the current directory and is called
```Versaloon-STM32F103C8_BluePill.bin```, you can flash it with the following
oneliner:

```
$ sudo docker run --privileged -v /dev/ttyUSB0:/dev/ttyUSB0 -v $PWD:/mnt zoobab/stm32flash -w /mnt/Versaloon-STM32F103C8_BluePill.bin -v -g 0x8000000 /dev/ttyUSB0
stm32flash 0.5

http://stm32flash.sourceforge.net/

Using Parser : Raw BINARY
Interface serial_posix: 57600 8E1
Version      : 0x22
Option 1     : 0x00
Option 2     : 0x00
Device ID    : 0x0410 (STM32F10xxx Medium-density)
- RAM        : 20KiB  (512b reserved by bootloader)
- Flash      : 128KiB (size first sector: 4x1024)
- Option RAM : 16b
- System RAM : 2KiB
Write to memory
Erasing memory
Wrote and verified address 0x0800d8ec (100.00%) Done.

Starting execution at address 0x08000000... done.

$ 
```

You can also use some variables:

```
$ export DEVICE="/dev/ttyUSB0"
$ export FILE="Versaloon-STM32F103C8_BluePill.bin"
$ sudo docker run --privileged -v $DEVICE:$DEVICE -v $PWD:/mnt zoobab/stm32flash -w /mnt/$FILE -v -g 0x8000000 $DEVICE
```
