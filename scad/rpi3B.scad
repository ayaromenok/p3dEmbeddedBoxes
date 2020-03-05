include <../p3dLib/lib.scad>
include <./components.scad>

rpiLength   = 85;
rpiWidth    = 56;
rpiHeight   = 35;
rpiRadius   = 3;
wallTk      = 1.3;    //box wall ThiKness
fTk         = 0.7;  //Filament addjustment ThiKness
spHeight    = 2;    //SuPport Height

rpi3Bbox(externalHolders = true);
            
module rpi3Bbox(px=0, py=0, pz=0, rx=0, ry=0, rz=0, externalHolders = false){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            translate([0,0,-wallTk]){
                minkowski(){
                    yCube(szx=(rpiLength-rpiRadius*2+fTk*2), szy=(rpiWidth-rpiRadius*2+fTk*2), szz=rpiHeight/2);
                    yCyl(rb=(rpiRadius+wallTk), rt=(rpiRadius+wallTk), px=rpiLength/2, py=rpiWidth/2, szz=rpiHeight/2);
                }//mink
            }//translate

            minkowski(){
                yCube(szx=(rpiLength-rpiRadius*2+fTk*2), szy=(rpiWidth-rpiRadius*2+fTk*2), szz=rpiHeight/2);
                yCyl(rb=rpiRadius, rt=rpiRadius, px=rpiLength/2, py=rpiWidth/2, szz=rpiHeight/2);
            }//mink
    
            //holes
            yCyl(rb=1.7, rt=1.7, szz=wallTk*2, px=3.5, py=3.5, pz=-rpiHeight/2);
            yCyl(rb=1.7, rt=1.7, szz=wallTk*2, px=3.5, py=(3.5+49), pz=-rpiHeight/2);
            yCyl(rb=1.7, rt=1.7, szz=wallTk*2, px=(3.5+58), py=3.5, pz=-rpiHeight/2);
            yCyl(rb=1.7, rt=1.7, szz=wallTk*2, px=(3.5+58), py=(3.5+49), pz=-rpiHeight/2);
    
            //nut holes
            yCyl(rb=3.3, rt=1.7, szz=wallTk, px=3.5, py=3.5, pz=-rpiHeight/2-wallTk/2);
            yCyl(rb=3.3, rt=1.7, szz=wallTk, px=3.5, py=(3.5+49), pz=-rpiHeight/2-wallTk/2);
            yCyl(rb=3.3, rt=1.7, szz=wallTk, px=(3.5+58), py=3.5, pz=-rpiHeight/2-wallTk/2);
            yCyl(rb=3.3, rt=1.7, szz=wallTk, px=(3.5+58), py=(3.5+49), pz=-rpiHeight/2-wallTk/2);    

            //connectors - front panel   
            powerUSBC(px=(3.5+7.7), pz=-rpiHeight/2+spHeight+3.5);
            displayHDMI(px=36, pz=-rpiHeight/2+spHeight+3.5);
            
            //audio
            yCyl2(rb=4, rt=4, szz=7, px=(3.5+7.7+14.8+13.5+7.5+7.5), py=-rpiHeight/2+spHeight+4.5,rx=90);
    
            //connectors - right panel
            ethRJ45(px=(rpiLength+wallTk/2), py=10.25, pz=-rpiHeight/2+spHeight+13/2+3.5);    
            usbUSBA(px=(rpiLength+wallTk/2), py=29, pz=-rpiHeight/2+spHeight+15/2+3.5);
            usbUSBA(px=(rpiLength+wallTk/2), py=47, pz=-rpiHeight/2+spHeight+15/2+3.5);
    
            //connectors - left panel
            sdCard(px=2,py=3.5+24.5,pz=-rpiHeight/2+1);    
    
            //holes for top/camera holder/etc
            if(rpiHeight>18){   //don't used on bottom-only boxes
                _r=(rpiRadius>wallTk)?wallTk:rpiRadius;
                    for (i=[0:rpiRadius*2:(rpiLength-rpiRadius*2)]){    
                        ySphere(r=_r, px=(rpiRadius+i), py=-(fTk-0.4), pz=(rpiHeight/2-_r*2-1));
                        ySphere(r=_r, px=(rpiRadius+i), py=(rpiWidth+fTk-0.4), pz=(rpiHeight/2-_r*2-1));
                    }//for
            }//if
        }//diff
        //baod support
        supportBoardRPi();

        if (externalHolders){
            boxConnectorM3(px=(-3.5-wallTk), py=5, pz=(-rpiHeight/2-wallTk+spHeight/2));
            boxConnectorM3(px=(-3.5-wallTk), py=(rpiWidth-5), pz=(-rpiHeight/2-wallTk+spHeight/2));
            boxConnectorM3(px=(3.5+58), py=(-3.5-wallTk),pz=(-rpiHeight/2-wallTk+spHeight/2));
            boxConnectorM3(px=(3.5+58), py=(rpiWidth+3.5+wallTk), pz=(-rpiHeight/2-wallTk+spHeight/2));
        }

    }//transform
}//module pri3Bbox

