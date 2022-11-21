// Based off of WhateverGreen's sample.dsl
// https://github.com/acidanthera/WhateverGreen/blob/master/Manual/Sample.dsl
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "AMDGPU", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)


    Scope (\_SB_.PCI0.PEG0.PEGP)
    {
        if (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package ()
                    {
                        "built-in", 
                        Buffer (One)
                        {
                             0x00                                           
                        }, 

                        "AAPL,slot-name", 
                        Buffer ()
                        {
                            "Internal@0,1,0/0,0" // Edit this Value, Get this Value in MacOS
                        }, 

                        "@0,AAPL,boot-display", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                         
                        },

                        "device-id", 
                        Buffer (0x04)
                        {
                             0xFF, 0x67, 0x00, 0x00                         
                        }, 

                        "no-gfx-spoof", 
                        Buffer (0x04)
                        {
                             0x00, 0x01, 0x00, 0x00                         
                        }, 

                        "ATY,DeviceID", 
                        Buffer (0x02)
                        {
                             0xFF, 0x67                         
                        },  

                        "model", 
                        Buffer ()
                        {
                            "AMD Radeon RX 550"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
    }
    Scope (\_SB.PCI0)
    {                   
        Method (DTGP, 5, NotSerialized)
        {
            If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
            {
                If (LEqual (Arg1, One))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Store (Buffer (One)
                            {
                                 0x03
                            }, Arg4)
                        Return (One)
                    }

                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
            }

            Store (Buffer (One)
                {
                     0x00
                }, Arg4)
            Return (Zero)
        }
      
    }

}