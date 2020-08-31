include <../p3dLib/lib.scad>

testComponents_v2();

module testComponents_v2(){
    echo ("g_isProduction need to be specified(and set to `true`) in main file");
    echo ("`unknown variable` message below is OK for call from components_v2 file");
    if (!g_isProduction){
        sdCard_v2(py=20);
        usbUSBADual_v2();
        usbUSBASingle_v2(py=-20);
        ethRJ45_v2(py=-40);
        powerUSBC_v2(py=-60);
        displayMicroHDMI_v2(py=-80);
        displayHDMI_v2(py=-100);
        //supportBoardRPi_v2();
        //boxConnectorM3_v2();
    }
}

//sdCard
module sdCard_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([px+depth/2, (py+1/2),(pz+5/2)])
    rotate([rx,ry,rz])    
    scale([sx,sy,sz]){
        minkowski(){
            yCube(depth,16,4);            
            ySphere(r=1);
        }//minkowski
    }//transform
}//module

//USB-A/USB2 or 3 - dual
module usbUSBADual_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([(px), (py+15.6/2),(pz+18/2)])
    rotate([rx,ry,rz])    
    scale([sx,sy,sz]){
        union(){
            minkowski(){
                yCube(szx=depth, szy=13.6, szz=17);
                yCyl(rb=1,rt=1, px=depth/2, py=-15/2, ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){
                yCube(szx=depth, szy=17.6, szz=20);
                yCyl(rb=1,rt=1, px=depth/2, py=-15/2, ry=90);
            }//minkowski
        }//union
    }//transform
}//module

//USB-A/USB2 or 3 - single
module usbUSBASingle_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([(px), (py+15.6/2),(pz+9/2)])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        union(){
            minkowski(){
                yCube(szx=depth, szy=14.2, szz=8);
                yCyl(rb=1,rt=1, px=depth/2, py=-15/2, ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){
                yCube(szx=depth, szy=17.2, szz=11);
                yCyl(rb=1,rt=1, px=depth/2, py=-15/2, ry=90);
            }//minkowski
        }//union
    }//transform
}//module

//RJ-45/Ethernet
module ethRJ45_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([px, (py+17/2),pz+16/2])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        union(){
            minkowski(){            
                yCube(szx=5, szy=15, szz=15);
                yCyl(rb=1,rt=1, px=depth/2, py=-16/2, ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){            
                yCube(szx=5, szy=18, szz=18);
                yCyl(rb=1,rt=1, px=depth/2, py=-16/2, ry=90);
            }//minkowski
        }//union
    }//transform
}//module


//power/USB-C
module powerUSBC_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([(px), (py+depth/2),pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        union(){
            minkowski(){
                yCube(depth,8,3);
                yCyl(rb=1,rt=1, px=depth/2, py=-8/2,ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){
                yCube(depth, 11, 6);
                yCyl(rb=1,rt=1, px=depth/2, py=-8/2,ry=90);
            }//minkowski
        }//union
    }//transform
}//module

//display/micro-HDMI
module displayMicroHDMI_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([(px),(py+depth/2),pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        union(){
            minkowski(){
                yCube(depth, 6, 3);
                yCyl(1, 1, depth/2, -6/2,ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){
                yCube(depth, 9, 6);
                yCyl(1, 1, depth/2, -6/2,ry=90);
            }//minkowski
        }//union
    }//transform
}//module


//displayHDMI
module displayHDMI_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([(px),(py+depth/2),pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        union(){
            minkowski(){
                yCube(depth, 15, 6);
                yCyl(1,1, depth/2, -15/2,ry=90);
            }//minkowski
            translate([1,0,0])
            minkowski(){
                yCube(depth, 15+3, 6+3);
                yCyl(1,1, depth/2, -15/2,ry=90);
            }//minkowski
        }//union
    }//transform
}//module

//support for board
module supportBoardRPi_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){    
            yCyl(rb=3, rt=3, szz=spHeight, px=3.5, py=3.5, pz=(-rpiHeight/2+spHeight/2));
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2, px=3.5, py=3.5, pz=(-rpiHeight/2+spHeight/2));
        }//diff
        difference(){    
            yCyl(rb=3, rt=3, szz=spHeight, px=3.5, py=(3.5+49), pz=(-rpiHeight/2+spHeight/2));
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2, px=3.5, py=(3.5+49), pz=(-rpiHeight/2+spHeight/2));
        }//diff
        difference(){    
            yCyl(rb=3, rt=3, szz=spHeight, px=(3.5+58), py=3.5, pz=(-rpiHeight/2+spHeight/2));
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2, px=(3.5+58), py=3.5, pz=(-rpiHeight/2+spHeight/2));
        }//diff    
        difference(){    
            yCyl(rb=3, rt=3, szz=spHeight, px=(3.5+58), py=(3.5+49), pz=(-rpiHeight/2+spHeight/2));
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2, px=(3.5+58), py=(3.5+49), pz=(-rpiHeight/2+spHeight/2));
        }//diff    
    }//transform
}//module

module boxConnectorM3_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){    
            yCyl(rb=4.5, rt=4.5, szz=spHeight);
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2);
        }//diff
    }//transform
}//module
