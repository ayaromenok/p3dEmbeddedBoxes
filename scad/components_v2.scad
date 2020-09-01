include <../lib/lib.scad>

testComponents_v2();

module testComponents_v2(){
    echo ("g_isProduction need to be specified(and set to `true`) in main file");
    echo ("`unknown variable` message below is OK for call from components_v2 file");
    if (!g_isProduction){
        sdCard_v2(0,0,0,0,0,0);
        sdCard_v2(0,0,0,0,0,90);
        usbUSBADual_v2(0,-20,0);        
        usbUSBADual_v2(0,-20,0,0,0,90);        
        usbUSBASingle_v2(0,-40,0,0,0,0);
        usbUSBASingle_v2(0,-40,0,0,0,90);
        ethRJ45_v2(0,-60,0,0,0,0);
        ethRJ45_v2(0,-60,0,0,0,90);
        powerUSBC_v2(0,-80,0,0,0,0);        
        powerUSBC_v2(0,-80,0,0,0,90);  
        displayMicroHDMI_v2(0,-100,0,0,0,0);
        displayMicroHDMI_v2(0,-100,0,0,0,90);
        displayHDMI_v2(0,-120,0,0,0,0);
        displayHDMI_v2(0,-120,0,0,0,90);
        audio3_5mm_v2(0,-140,0,0,0,0);
        audio3_5mm_v2(0,-140,0,0,0,90);        
    }
}

//sdCard
module sdCard_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([px,py,pz])
    rotate([rx,ry,rz])    
    scale([sx,sy,sz]){
        translate([depth/2, 1/2, 5/2])
        minkowski(){
            yCube(depth,16,4);            
            ySphere(r=1);
        }//minkowski
    }//transform
}//module

//USB-A/USB2 or 3 - dual
module usbUSBADual_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([px, py,pz])
    rotate([rx,ry,rz])    
    scale([sx,sy,sz]){
        translate([0, 15.6/2,(pz+18/2)])
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
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        translate([0, (15.6/2),(9/2)])
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
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        translate([0, (17/2),(16/2)])
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
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz])
    {
        translate([0,(8/2),3])
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
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        translate([0,(6/2),0])
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
    translate([px,py,pz])
    rotate([rx,ry,rz])
    scale([sx,sy,sz]){
        translate([0,(15/2),0])
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

//audio 3.5mm
module audio3_5mm_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, sx=1, sy=1, sz=1, depth=5){
    translate([px, py,pz])
    rotate([rx,ry,rz])    
    scale([sx,sy,sz]){
        translate([0, 0,3])
        union(){            
            yCyl(3, depth, ry=90);            
            yCyl(5, depth, 1,ry=90);            
        }//union
    }//transform
}//module


