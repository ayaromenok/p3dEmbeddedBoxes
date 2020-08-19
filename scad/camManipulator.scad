include <../lib/lib.scad>
include <./components.scad>

//camManipulator();

camSegment(px=50, length=50, rx=90);


module camSegment(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6, length=30, mX=4){
    _tk=thickness;
    _tk_2=thickness/2;
    _tk_x2=thickness*2;
    _shift=0.4;
    _r = mX/2+_shift;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(_tk,_tk);                       
                yCyl(_tk,_tk_2,   length,0,_tk*3/4+_shift);
                yCyl(_tk,_tk_2,   length,0,-_tk*3/4-_shift);
                
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]],
                    szz=_tk_x2, py=_tk, rx=90);        
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]], 
                    szz=_tk_x2, py=-_tk, rx=-90);                
            }//union
            yCyl(_r,_tk_x2);
            yCyl(_r,_tk_x2,   length,0,_tk+_shift);
            yCyl(_r,_tk_x2,   length,0,-_tk-_shift);            
            
        }//difference
        
    }//transform
}//module 


module camManipulator(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6){
    thickness_2=thickness/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(10,thickness,  0,0,0);                
            }//union
            //holes
            yCyl(2.3,10,  0,0,0);            
            //holes for nuts
            yCyl(5.3,10,  0,0,thickness_2);
            
        }//diff
    }//transform
}//module 

module camManipulatorX2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6){
    thickness_2=thickness/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(10,thickness,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),0);
                yCyl(10,thickness,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),0);  
            }//union
            //holes
            yCyl(2.3,10,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),0);
            yCyl(2.3,10,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),0);        
            //holes for nuts
            yCyl(5.3,10,  -(164.9/2)+((101.13-86.43)/2)+86.43+25, (124.31/2+8),thickness_2);
            yCyl(5.3,10,  -(164.9/2)+((101.13-86.43)/2)+67.11-25, (124.31/2+8),thickness_2);
        }//diff
    }//transform
}//module 