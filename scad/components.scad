include <../p3dLib/lib.scad>


//sdCard
module sdCard(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px-5/2), (py+1/2),pz])
    rotate([rx,ry,rz]){
        minkowski(){
            yCube(szx=5, szy=16, szz=4);            
            ySphere(r=1);
        }//minkowski
    }//transform
}//module

//USB-A/USB2 or 3
module usbUSBA(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px-5/2), (py+15.6/2),pz])
    rotate([rx,ry,rz]){
        minkowski(){
            yCube(szx=5, szy=13.6, szz=17);
            yCyl(rb=1,rt=1, px=5/2, py=-15/2, ry=90);
        }//minkowski
    }//transform
}//module

//RJ-45/Ethernet
module ethRJ45(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px-5/2), (py+17/2),pz])
    rotate([rx,ry,rz]){
        minkowski(){
            yCube(szx=5, szy=15, szz=15);
            yCyl(rb=1,rt=1, px=5/2, py=-16/2, ry=90);
        }//minkowski
    }//transform
}//module


//power/USB-C
module powerUSBC(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px-8/2), (py+5/2),pz])
    rotate([rx,ry,rz]){
        minkowski(){
            yCube(szx=8, szy=5,szz=3);
            yCyl(rb=1,rt=1, px=8/2, py=-5/2,rx=90);
        }//minkowski
    }//transform
}//module

//display/micro-HDMI
module displayMicroHDMI(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px-6/2),(py+5/2),pz])
    rotate([rx,ry,rz]){
        minkowski(){
            yCube(szx=6, szy=5,szz=3);
            yCyl(rb=1,rt=1, px=8/2, py=-5/2,rx=90);
        }//minkowski
    }//transform
}//module




//support for board
module supportBoardRPi(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
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

module boxConnectorM3(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){    
            yCyl(rb=4.5, rt=4.5, szz=spHeight);
            yCyl(rb=1.7, rt=1.7, szz=spHeight*2);
        }//diff
    }//transform
}//module
