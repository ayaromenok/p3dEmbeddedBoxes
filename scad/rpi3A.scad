include <../p3dLib/lib.scad>
include <./components.scad>

rpiLength   = 65;
rpiWidth    = 58;
rpiHeight   = 22;
rpiRadius   = 3;
wallTk      = 2.5;    //box wall ThiKness
fTk         = 0.7;  //Filament addjustment ThiKness
spHeight    = 2;    //SuPport Height

rpi3Bbox(secBot=true,externalHolders = true);
rpi3Bbox(secBot=false, rx=180, py=-20);
//       cutSection(10,0,5,   0,0,0,   20,3,7); 
//        addSection(10,5,5,   0,0,0,   20,3,7); 
//addSection();
//cutSectionTop(py=10);
            
module rpi3Bbox(px=0, py=0, pz=0, rx=0, ry=0, rz=0, secBot=true, externalHolders = false){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            _trns=0;
 
            
            translate([0,0,(secBot?-wallTk:wallTk)]){
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
            powerUSBC(px=(3.5+7.1), pz=-rpiHeight/2+spHeight+3.5);
            powerUSBC(px=(3.5+5), py=-4,pz=-rpiHeight/2+spHeight+3.5, sx=1.6,sz=1.6);
            
            displayHDMI(px=35.4, pz=-rpiHeight/2+spHeight+5.5);            
            displayHDMI(px=34.4, py=-4, pz=-rpiHeight/2+spHeight+5.5, sx=1.3,sz=1.3);            
            //audio
            yCyl2(rb=4, rt=4, szz=7, px=(3.5+7.7+14.8+13.5+7.5+6.9), py=-rpiHeight/2+spHeight+4.5,rx=90);
            yCyl2(rb=6, rt=6, szz=3, px=(3.5+7.7+14.8+13.5+7.5+6.9), py=-rpiHeight/2+spHeight+4.5, pz=3,rx=90);
    
            //connectors - right panel
            usbUSBASingle(px=(rpiLength+wallTk/2), py=31, pz=-rpiHeight/2+spHeight+9/2+2.5);
            usbUSBASingle(px=(rpiLength+wallTk)+0.4, py=34.5, pz=-rpiHeight/2+spHeight+9/2+2.5, sy=1.4,sz=1.4, depth=wallTk);
            
            //connectors - left panel
            sdCard(px=2,py=3.5+24.5,pz=-rpiHeight/2+1);        
            
            if (secBot){
                cutSection(32,-wallTk/2-fTk,-5,   0,0,0,   60,3,14); 
                cutSection(-wallTk/2-fTk,rpiWidth/2,-9,   0,0,90,   30,3,18); 
                cutSection(rpiLength+wallTk/2+fTk,rpiWidth/2,-5,   0,0,90,   30,3,14); 
                
                yCube(60,20,rpiHeight, rpiLength/2, rpiWidth,5);
            } else {
                cutSectionTop(32,-wallTk/2-fTk,-5,   0,0,0,   60,3,14); 
                cutSectionTop(-wallTk/2-fTk,rpiWidth/2,-9,   0,0,90,   30,3,18); 
                cutSectionTop(rpiLength+wallTk/2+fTk,rpiWidth/2,-5,   0,0,90,   30,3,14); 
                //general cut
                yCube(rpiLength*2,rpiWidth*2,rpiHeight, rpiLength/2, rpiWidth/2,-15.5);
                yCube(rpiLength*2,wallTk*2,rpiHeight, rpiLength/2, rpiWidth+wallTk/2,-1.8);
                
                yCube(60,20,rpiHeight, rpiLength/2, rpiWidth,10);
                yCube(20,20,rpiHeight, 27, 35,5);
                yCube(20,20,rpiHeight, 0, rpiWidth/2,12);
                yCube(10,22,rpiHeight, 45, 10,10);
                
                //cam holder
               yCyl(2.3,10,  5,5,rpiHeight-10);  
               yCyl(2.3,10,  rpiLength-3,5,rpiHeight-10);  
            }//if/else secBot
        }//diff
        
        if (secBot){
            //board support
            supportBoardRPi();

            if (externalHolders){
                boxConnectorM3(px=(-3.5-wallTk), py=5, pz=(-rpiHeight/2-wallTk+spHeight/2));
                boxConnectorM3(px=(-3.5-wallTk), py=(rpiWidth-5), pz=(-rpiHeight/2-wallTk+spHeight/2));
                boxConnectorM3(px=(rpiLength+3.5+wallTk), py=5,pz=(-rpiHeight/2-wallTk+spHeight/2));
                boxConnectorM3(px=(rpiLength+3.5+wallTk), py=(rpiWidth-5), pz=(-rpiHeight/2-wallTk+spHeight/2));
            }//if externalHolders
        }//if secBot
    }//transform
}//module pri3Bbox

module cutSection(px=0, py=0, pz=0, rx=0, ry=0, rz=0, length=10, width=2, height=10, sht=0.2){
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

