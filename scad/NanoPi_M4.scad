include <../lib/lib.scad>
include <./components.scad>

NanoPI_M4();

module NanoPI_M4(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=4){
    translate([px, py, pz])
    rotate([rx,ry,rz]){        
        thickness_2=thickness/2;
        difference(){
            //board size
            union(){
                yCube(66,57,thickness);        
                //support on the coners
                yCyl(4,4,   29,24.5,thickness_2+2);
                yCyl(4,4,   29,-24.5,thickness_2+2);
                yCyl(4,4,   -29,24.5,thickness_2+2);
                yCyl(4,4,   -29,-24.5,thickness_2+2);
              
                //cam position                
                yCyl(10,thickness,  39.5, 0,0);
                
            }//union            
            
            yCube(50,55/2,thickness*2, 0,56/3,0);        
            yCube(50,55/2,thickness*2, 0,-56/3,0);        
            
            //holes on the coners
            yCyl(1.75,thickness+10,   29,24.5,0);
            yCyl(1.75,thickness+10,   29,-24.5,0);
            yCyl(1.75,thickness+10,   -29,24.50);
            yCyl(1.75,thickness+10,   -29,-24.5,0);
            
            //cam holder
            yCyl(2.3,10,  39.5,0,0);        
            
            
        }//difference        
        
    }//transform
}//module waveshareCM_IO

