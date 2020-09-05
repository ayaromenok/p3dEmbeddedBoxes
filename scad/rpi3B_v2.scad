include <./components_v2.scad>
include <./boxParts_v2.scad>

//include <./components.scad>
g_isProduction = true; //true to avoid displaying test components
rpi3BBot(0,-40);
//rpi3BTop(0,40,22,180);
//rpi3B();

module rpi3BBot(px=0, py=0, pz=0, rx=0, ry=0, rz=0, height=22, isExtHolders = false, thickness=3){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
    difference(){
            rpi3B();        
        /*
            yCube(75,66,(22+thickness*2+0.4*2),0,0,33.6);
            cutSectionBot(-1.,-(56/2+thickness/2+0.7),6,            length=58, width=thickness, height=13);
            //cutSectionBot(0,(56/2+thickness/2+0.7),6,               length=58, width=thickness, height=13);
            cutSectionBot((65/2+thickness/2+0.4),(-56/2+31.45),6,   0,0,90,length=30, width=thickness, height=13);
            cutSectionBot(-(65/2+thickness/2+0.4),0,6,              0,0,90,length=30, width=thickness, height=13);
        */
            yCube(100,70,21,10,0,16);   
        }//diff     
     
    }//translate
}//module rpi3ABot

module rpi3BTop(px=0, py=0, pz=0, rx=0, ry=0, rz=0, height=22, isExtHolders = false, thickness=3){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){            
            rpi3B();
            /*cutSectionTop(-1,-(56/2+thickness/2+0.7),5.99,             length=58, width=thickness, height=13, sht=0.3);
            cutSectionTop(0,(56/2+thickness/2+0.7),5.99,               length=38, width=thickness, height=13, sht=0.3);
            cutSectionTop((65/2+thickness/2+0.4),(-56/2+31.45),5.99,   0,0,90,length=30, width=thickness, height=13, sht=0.3);
            cutSectionTop(-(65/2+thickness/2+0.4),0,5.99,              0,0,90, length=30, width=thickness, height=13, sht=0.3);
            yCube(95,86,(22+thickness*2+0.4*2),0,0,-7.95);*/
        }//diff        
    }//translate
}//module rpi3ATop

module rpi3B(px=0, py=0, pz=0, rx=0, ry=0, rz=0, height=22, isExtHolders = false, thickness=3){
    _shift=0.4; //board quality+nozzle diameter    
    _r = 2;
    _t = thickness;
    _R = _r+_t;
    _l = 85-_r*2+_shift*2;
    _w = 56-_r*2+_shift*2+0.6;//0.6 - magick number - re-measure on real detail
    _h = height;    
    _l_2=_l/2;
    _w_2=_w/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            //external
            translate([-_l_2+10,-_w_2, _h/2])
            minkowski(){
                yCube(_l,_w,_h-1+_t*2);
                yCyl(_R,1, _l_2,_w_2);
            }//mink
            //internal
            translate([-_l_2+10,-_w_2, _h/2])
            minkowski(){
                yCube(_l,_w,_h-1);
                yCyl(_r,1, _l_2,_w_2);
            }//mink 
            
            //connectors - front
            powerUSBC_v2((-_l_2+19.3),(-56/2-_shift),3,      0,0,-90);
            displayHDMI_v2((-_l_2+40.5),(-56/2-_shift),3.5, 0,0,-90);
            audio3_5mm_v2((_l_2-19.5),(-56/2-_shift),3.5,    0,0,-90);
        
            //connectors - right
            usbUSBADual_v2((85/2+10+0.2),(-56/2+47),1.5);
            usbUSBADual_v2((85/2+10+0.2),(-56/2+29),1.5);
            ethRJ45_v2((85/2+10+0.2),(-56/2+10.25),3);
            
            //usbUSBADual_v2((85/2+10+0.2),(-56/2+31.45),3);                        
            
            //connectors - left
            sdCard_v2(-(65/2),0,(-3+3),     0,0,180);
            sdCard_v2(-(65/2),0,-3,         0,0,180);//extend to bottom
            
            heatHoleV(-(65/2),22,(3),       0,0,180);
            heatHoleV(-(65/2),5,(10),     0,0,180);
            heatHoleV(-(65/2),-5,(10),     0,0,180);
            heatHoleV(-(65/2),-22,(3),      0,0,180);
            
            //connectors - back            
            rpi40PinHeader_v2(0,(49/2+_t+3+_shift),6);
            rpi40PinHeader_v2(0,(49/2+_t+3+_shift),16);
            
            //connectors - top            
            rpi40PinHeader_v2(0,(49/2+1),_h-_shift);
            cameraBasement_v2(58/2,(-56/2+11.5),_h);
            cameraBasement_v2(-58/2,(-56/2+11.5),_h);
            cameraFFC_v2((-65/2+45),(-56/2+11.5),_h);
                // display in fact
            cameraFFC_v2((-65/2+4.5),0,_h);
                //heater output
            yCube(58/2,20,_h, -4,6,_h);    
            fan40mmHoles(-11,9,_h-_shift);
            
            //connectors - bottom
            basementRPiCut_v2(0,0,-thickness);
            
            //dev
            //yCube(_l,_w,_h,0,0,_h);    
        }//diff
        basementRPi_v2();
        
        boxHolderRPiAWider_v2(10,0,-thickness, isModelA=false);
    }//translate    
}//module





