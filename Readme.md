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
- Find the acpi path for your Graphics Card under Windows, Something like this: ACPI(\_SB_)#ACPI(PCI0)#ACPI(GPP0)#ACPI(VGA_). Then your acpi path will be "\_SB_.PCI0.GPP0.GPP0.VGA_"
- Get the [SSDT-GPU-SPOOF](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-GPU-SPOOF.dsl.zip) as dortania.github.io suggested.
    - The .dsl file may look like this: [SPOOF-ORIGINAL]().
    - Replace the "\_SB_.PCI0.PEG0.PEGP" like variables with the acpi path you've got.
    - Replace the "Method (_DSM, 4, NotSerialized)" method with the method like this: [method]().
    - Goto acpi.org, and download the [acpi tools](https://acpica.org/downloads/binary-tools).
    - Compile the final GPU-SPOOF.dsl file with command like "./iasl.exe SSDT-GPU-SPOOF.dsl".
    - Now you can install Hackintosh with Graphics Card working but acceleration is not enabled, assuming you have already gathered other files.
- After installation completed, login Hackintosh, and find your VGA compatible controller in Device properties using OpenCore Configurator. Copy the value of slot name, which may looks like "Internal@0,1,0/0,0".
- Replace the slot name in your GPU-SPOOF.dsl file, recompile, save it to EFI. Then your AMD RX550 Lexa Core Graphics Card will be enabled with acceleration.
- Note that SSDT-GPU-SPOOF also need WhateverGreen.kext.

## Thanks to
- https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html#prerequisites
- https://github.com/dortania/bugtracker/issues/129
- https://github.com/dortania/bugtracker/issues/264
- https://github.com/felipecaninnovaes/Ryzentosh-Rx550Lexa

## Screen Shots
![graphics card]()