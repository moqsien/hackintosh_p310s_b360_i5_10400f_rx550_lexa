## [中文](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/docs/Readme_CN.md) | [English](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa)
------------------------

## 适用平台
- CPU：I5-10400F
- 主板芯片组：双影王族(深圳)科技有限公司的P310S B360迷你电脑；
- 独立显卡：AMD RX550 4G，Lexa核心，512Ps，无法免驱
- 无线网卡：随准系统赠送的Intel AC7265

## 使用到的软件工具
- Hackintosh: Monterey 12.6
- BalenaEtcher: 1.5.115
- OpenCore: [0.8.6](https://github.com/acidanthera/OpenCorePkg/releases), [Docs](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html) 
- OCAuxiliaryTools: [latest](https://github.com/ic005k/OCAuxiliaryTools/releases)
- ProperTree: [latest](https://github.com/corpnewt/ProperTree)
- OpenCore Configurator: [2.63.1.0](https://mackie100projects.altervista.org/download-opencore-configurator/)
- Hackintool: [3.9.1](https://github.com/headkaze/Hackintool/releases)

## 无线网卡和蓝牙驱动
- [AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases)
- [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM/releases)

## USB 3.0修复
- 使用Hackintool，具体的搜索教程就行，比较常规；
- 如果使用同款主机，则可以使用本项目的[USBPorts.kext]()；
- 注意使用USBPorts.kext之后，就不用USBInjectAll.kext了，将其disable掉就行，否则USB 3.0接口将无法识别USB 2.0的U盘；

## AMD RX550 Lexa驱动(支持硬解加速)
- 先在机器上安装win10，装好显卡驱动，在"设备管理器>显示适配器"中找到对应显卡，然后查看显卡的"详细信息>位置路径"，记下第二项，例如：(\_SB_)#ACPI(PCI0)#ACPI(GPP0)#ACPI(VGA_)，[截图示例](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/pics/pcie_graphics.png)；根据位置路径，得到显卡的APCI路径，类似"\_SB_.PCI0.GPP0.GPP0.VGA_"；
- 下载[SSDT-GPU-SPOOF.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-GPU-SPOOF.dsl.zip)；
  - .dsl文件类似于：[SPOOF-ORIGINAL](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-ORIGINAL.dsl)；
  - 用上面得到的APCI路径替换掉.dsl文件中的类似"\_SB_.PCI0.PEG0.PEGP"之类的参数；
  - 用[新方法](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-METHOD.txt)替换掉.dsl文件中的"Method (_DSM, 4, NotSerialized)"方法；
  - 去acpi.org[官网](https://acpica.org/downloads/binary-tools)下载acpi工具, [macos版本](https://github.com/HelllGuest/acpica-tools-macos)；
  - 使用"./iasl.exe SSDT-GPU-SPOOF.dsl"(在win下)命令编译[.dsl](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/GPU-SPOOF-FINALEXAMPLE.dsl)文件；
  - 此时已经仿冒好了显卡ID，可以安装，但是显卡不支持硬解加速；
  - 先安装Hackintosh；
- 安装完成之后，登录Hackintosh，在Hackintosh中用OpenCore Configurator查看Device properties下的VGA compatible controller，找到slot name(即显卡插槽名称)，记录下value；
- 将上面得显卡插槽名称替换到SDDT-GPU-SPOOF.dsl文件(具体位置参考.dsl中的注释)；
- 重新编译.dsl，得到的.aml文件加入EFI中，至此AMD RX550 Lexa显卡成功驱动，支持硬解加速；
- 注意SSDT-GPU-SPOOF需要WhateverGreen.kext支持；
- 如果想要在监控软件中显示显卡温度，则需要另外的[.kext文件](https://github.com/aluveitie/RadeonSensor/releases)；
- 显卡风扇参数调整，亲测有一定效果：[视频](https://www.bilibili.com/video/BV1ZT4y1v7Ac/?spm_id_from=333.337.search-card.all.click), [帖子](https://www.reddit.com/r/hackintosh/comments/hg56pv/guide_polaris_rx_560_580_etc_custom_powerplay/)

## 感谢
- https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html#prerequisites
- https://github.com/dortania/bugtracker/issues/129
- https://github.com/dortania/bugtracker/issues/264
- https://github.com/felipecaninnovaes/Ryzentosh-Rx550Lexa

## 截图
![graphics card](https://github.com/moqsien/hackintosh_p310s_b360_i5_10400f_rx550_lexa/blob/main/files/pics/screen_shot.jpg)
