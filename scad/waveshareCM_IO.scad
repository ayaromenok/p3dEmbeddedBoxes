include <../lib/lib.scad>
include <./components.scad>

waveshareCM_IO(externalSupport=true);

module waveshareCM_IO(px=0, py=0, pz=0, rx=0, ry=0, rz=0, externalSupport = false){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        thickness=6;
        thickness_2=thickness/2;
        difference(){
            //board size
            union(){
                yCube(168.9,128.31,thickness);        
                //support on the coners
                yCyl(4,4,   (156.9/2),(114.96/2),thickness_2+2);
                yCyl(4,4,   (156.9/2),-(114.96/2),thickness_2+2);
                yCyl(4,4,   -(156.9/2),(114.96/2),thickness_2+2);
                yCyl(4,4,   -(156.9/2),-(114.96/2),thickness_2+2);
                //support center
                yCyl(4,4,   -2.5,4.5,thickness_2+2);                
                //cam position
                //yCyl(10,thickness,  -(164.9/2)+((101.13-86.43)/2)+(86.43+67.11)/2, (124.31/2+8),0);
                yCyl(10,thickness,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),0);
                yCyl(10,thickness,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),0);        
                if(externalSupport){
                    //support side
                    yCyl(5,thickness,   (156.9/2),(134.31/2),0);
                    yCyl(5,thickness,   (156.9/2),(-134.31/2),0);
                    yCyl(5,thickness,   -(156.9/2),(134.31/2),0);
                    yCyl(5,thickness,   -(156.9/2),(-134.31/2),0);
                
                }//if externalSupport
            }//union
            
            //ligther chassis
            yCube(70,110,10,39,0,0);
            yCube(66,110,10,-41,0,0);
            
            //holes on the coners
            yCyl(1.75,thickness+10,   (156.9/2),(114.96/2),0);
            yCyl(1.75,thickness+10,   (156.9/2),-(114.96/2),0);
            yCyl(1.75,thickness+10,   -(156.9/2),(114.96/2),0);
            yCyl(1.75,thickness+10,   -(156.9/2),-(114.96/2),0);
            //holes center
            yCyl(2.25,thickness+10,   -2.5,4.5,2);            
            
            //cam positions
            yCyl(2.3,10,  -(164.9/2)+((101.13-86.43)/2)+(86.43+67.11)/2, (124.31/2+8),0);
            yCyl(2.3,10,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),0);
            yCyl(2.3,10,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),0);        
            
            //holes for nuts
            //holes on the coners
            yCyl(rb=6.75, rt=3.75,szz=thickness,   px=(156.9/2),py=(114.96/2),pz=-thickness_2);
            yCyl(rb=6.75, rt=3.75,szz=thickness,   px=(156.9/2),py=-(114.96/2),pz=-thickness_2);
            yCyl(rb=6.75, rt=3.75,szz=thickness,   px=-(156.9/2),py=(114.96/2),pz=-thickness_2);
            yCyl(rb=6.75, rt=3.75,szz=thickness,   px=-(156.9/2),py=-(114.96/2),pz=-thickness_2);
            //holes center
            yCyl(rb=6.75, rt=3.75,szz=thickness,   px=-2.5,py=4.5,pz=-thickness_2);            
            
            //cam positions
            //yCyl(5.3,10,  -(164.9/2)+((101.13-86.43)/2)+(86.43+67.11)/2, (124.31/2+8),-thickness_2);
            yCyl(5.3,10,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),-thickness_2);
            yCyl(5.3,10,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),-thickness_2);        
            if(externalSupport){
            //support side
                yCyl(2.3,thickness*2,   (156.9/2),(134.31/2),0);
                yCyl(2.3,thickness*2,   (156.9/2),(-134.31/2),0);
                yCyl(2.3,thickness*2,   -(156.9/2),(134.31/2),0);
                yCyl(2.3,thickness*2,   -(156.9/2),(-134.31/2),0);
                
            }//if externalSupport
        }//difference        
        
    }//transform
}//module waveshareCM_IO

