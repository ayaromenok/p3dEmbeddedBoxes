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
        cutSectionBot(0,-50);
        cutSectionTop(0,-60);
        addSection(0,-70);
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



module cutSectionBot(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=10, width=2, height=10, sht=0.2){
    l_2=length/2;
    w_2=width/2;
    w_4=width/4;
    h_2=height/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        union(){
            yPoly(p=[[l_2+sht,0],[(l_2-w_2),w_2+sht],[-(l_2-w_2),w_2+sht],[-l_2-sht,0],[-(l_2-w_2),-w_2-sht],[(l_2-w_2),-w_2-sht]],szz=height+sht);        
            ySphere(w_2+sht,l_2-w_4,0,h_2);
            ySphere(w_2+sht,-l_2+w_4,0,h_2);        
        }//union
    }//transform
}//module

module addSection(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=10, width=2, height=10, sht=0.2){
    l_2=length/2;
    w_2=width/2;
    w_4=width/4;
    h_2=height/2;
    translate([px, py, pz+sht*2])
    rotate([rx,ry,rz]){
        union(){
            yPoly(p=[[l_2-sht,0],[(l_2-w_2),w_2-sht],[-(l_2-w_2),w_2-sht],[-l_2+sht,0],[-(l_2-w_2),-w_2+sht],[(l_2-w_2),-w_2+sht]],szz=height-sht);
            ySphere(w_2-sht,l_2-w_4,0,h_2);
            ySphere(w_2-sht,-l_2+w_4,0,h_2);
        }//union
    }//transform
}//module

module cutSectionTop(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=10, width=2, height=10, sht=0.2, coefLenght=5, coefWidth=2){
    l_2=length/2;
    w_2=width/2;
    w_4=width/4;
    h_2=height/2;
    translate([px, py, pz+sht*2])
    rotate([rx,ry,rz]){
        difference(){
            yCube(length*coefLenght, width*coefWidth, (height-sht), pz=(height-sht)/2);
            
            union(){
                yPoly(p=[[l_2-sht,0],[(l_2-w_2),w_2-sht],[-(l_2-w_2),w_2-sht],[-l_2+sht,0],[-(l_2-w_2),-w_2+sht],[(l_2-w_2),-w_2+sht]],szz=height-sht);
                ySphere(w_2-sht,l_2-w_4,0,h_2);
                ySphere(w_2-sht,-l_2+w_4,0,h_2);
            }//union            
            yCube((l_2-w_2)*2,width*3,height-sht, pz=(height-sht)/2);
        }//diff
        
    }//transform
}//module


// not ported - need to evaluate
module boxConnectorM3_v2(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){    
            yCyl(rb=4.5, rt=4.5, szz=spHeight);
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2);
        }//diff
    }//transform
}//module


