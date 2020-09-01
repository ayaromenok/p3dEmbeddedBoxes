include <../lib/lib.scad>

testBoxParts_v2();


module testBoxParts_v2(){
    echo ("g_isProduction need to be specified(and set to `true`) in main file");
    echo ("`unknown variable` message below is OK for call from components_v2 file");
    if (!g_isProduction){
        basementRPi_v2();
        rpi40PinHeader_v2();
        cameraBasement_v2(0,-10);
        cameraFFC_v2(0,-30);
    }//if !g_isProduction
}//module


//support for board
module basementRPi_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        translate([0,0,1]){
            difference(){
                yCyl(3,2,58/2,49/2);
                yCyl(1.7,3,58/2,49/2);
            }//dif
            difference(){
                yCyl(3,2,58/2,-49/2);
                yCyl(1.7,3,58/2,-49/2);
            }//dif
            difference(){
                yCyl(3,2,-58/2,49/2);
                yCyl(1.7,3,-58/2,49/2);
            }//dif
            difference(){
                yCyl(3,2,-58/2,-49/2);
                yCyl(1.7,3,-58/2,-49/2);
            }//dif
        }//translate
    }//transform
}//module basementRPi_v2

//40 pin header
module rpi40PinHeader_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        translate([0,0,5])
        yCube(50,6,10);
    }//transform
}//rpi40PinHeader_v2


//camera basement
module cameraBasement_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yCyl(2.3, 10);
    }//transform
}//camerasBasement_v2


//camera FFC
module cameraFFC_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yCube(6,20,10);
    }//transform
}//cameraFFC_v2

module boxConnectorM3_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){    
            yCyl(rb=4.5, rt=4.5, szz=spHeight);
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2);
        }//diff
    }//transform
}//module