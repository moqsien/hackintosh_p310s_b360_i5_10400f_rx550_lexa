## [English](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa) | [中文](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/docs/Readme_CN.md)
------------------------

## Platform
- CPU: I5-10400F
- Motherboard: [Soarsea P310S B360](https://syvvz.com/gysoarsea)
- Graphics Card: AMD RX550 4G (Core Lexa Ps512)
- Wifi Card: Intel AC7265

## Software Version
- Hackintosh: Monterey 12.6
- BalenaEtcher: 1.5.115
- OpenCore: [0.8.6](https://github.com/acidanthera/OpenCorePkg/releases), [Docs](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html) 
- OCAuxiliaryTools: [latest](https://github.com/ic005k/OCAuxiliaryTools/releases)
- ProperTree: [latest](https://github.com/corpnewt/ProperTree)
- OpenCore Configurator: [2.63.1.0](https://mackie100projects.altervista.org/download-opencore-configurator/)
- Hackintool: [3.9.1](https://github.com/headkaze/Hackintool/releases)

## How to hack Wifi and Bluetooth?
- [AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases)
- [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM/releases)

## How to hack USB 3.0?
- Use hackintool.
- A handy [USBPorts.kext]() for Soarsea P310S B360 is available in this project.
- Note that, USBInjectAll.kext must be disabled when using USBPorts.kext.

## How to hack Graphics Card?
- Find the acpi path for your Graphics Card under Windows, Something like this: ACPI(\_SB_)#ACPI(PCI0)#ACPI(GPP0)#ACPI(VGA_), [example](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/pics/pcie_graphics.png). Then your acpi path will be "\_SB_.PCI0.GPP0.GPP0.VGA_"
- Get the [SSDT-GPU-SPOOF](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-GPU-SPOOF.dsl.zip) as dortania.github.io suggested.
    - The .dsl file may look like this: [SPOOF-ORIGINAL](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-ORIGINAL.dsl).
    - Replace the "\_SB_.PCI0.PEG0.PEGP" like variables with the acpi path you've got.
    - Replace the "Method (_DSM, 4, NotSerialized)" method with the method like this: [new method](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-METHOD.txt).
    - Goto acpi.org, and download the [acpi tools](https://acpica.org/downloads/binary-tools); acpi tools for [macos](https://github.com/HelllGuest/acpica-tools-macos).
    - Compile the final [GPU-SPOOF.dsl](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-FINALEXAMPLE.dsl) file with command like "./iasl.exe SSDT-GPU-SPOOF.dsl".
    - Now you can install Hackintosh with Graphics Card working but acceleration is not enabled, assuming you have already gathered other files.
- After installation completed, login Hackintosh, and find your VGA compatible controller in Device properties using OpenCore Configurator. Copy the value of slot name, which may looks like "Internal@0,1,0/0,0".
- Replace the slot name in your GPU-SPOOF.dsl file, recompile, save it to EFI. Then your AMD RX550 Lexa Core Graphics Card will be enabled with acceleration.
- Note that SSDT-GPU-SPOOF also need WhateverGreen.kext.
- If you wanna show Graphics Card Temperature, you may also need this [.kext file](https://github.com/aluveitie/RadeonSensor/releases).
- Adjust the parameters for fans of the graphics card：[video](https://www.bilibili.com/video/BV1ZT4y1v7Ac/?spm_id_from=333.337.search-card.all.click), [post](https://www.reddit.com/r/hackintosh/comments/hg56pv/guide_polaris_rx_560_580_etc_custom_powerplay/)

## Thanks to
- https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html#prerequisites
- https://github.com/dortania/bugtracker/issues/129
- https://github.com/dortania/bugtracker/issues/264
- https://github.com/felipecaninnovaes/Ryzentosh-Rx550Lexa

## Screen Shots
![graphics card](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/pics/screen_shot.jpg)
