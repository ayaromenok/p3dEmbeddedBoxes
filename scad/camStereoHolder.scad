include <../lib/lib.scad>
include <./components.scad>


armCamHolder_MCAM400_x2(ry=90, stereoBase=64);


module armCamHolder_MCAM400_x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6, length=20, mX=4, stereoBase=64){
    _tk=thickness;
    _tk_2=thickness/2;
    _tk_x2=thickness*2;
    _shift=0.4;
    _r = mX/2+_shift;
    _sb=stereoBase;
    _sb_2=_sb/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCube(_sb+27,19,2, length,3,0, 0,90,0);
                yCube(_sb+27,3,4, length-3,3,0, 0,90,0);
                yCyl(_tk,_tk);                     
              
                
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]],
                    szz=_tk_x2, py=_tk, rx=90);        
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]], 
                    szz=_tk_x2, py=-_tk, rx=-90);                
            }//union
            yCyl(_r,_tk_x2);            
            
            //cam holes (~2.5)
            yCyl2(1.9,_tk,  _sb_2+10.5,9.5, length, 0,90,0 );  
            yCyl2(1.9,_tk,  _sb_2+10.5,-3, length, 0,90,0 );  
            yCyl2(1.9,_tk,  _sb_2-10.5,9.5, length, 0,90,0 );  
            yCyl2(1.9,_tk,  _sb_2-10.5,-3, length, 0,90,0 );  
            
            
            yCyl2(1.9,_tk,  -_sb_2+10.5,9.5, length, 0,90,0 );  
            yCyl2(1.9,_tk,  -_sb_2+10.5,-3, length, 0,90,0 );  
            yCyl2(1.9,_tk,  -_sb_2-10.5,9.5, length, 0,90,0 );  
            yCyl2(1.9,_tk,  -_sb_2-10.5,-3, length, 0,90,0 );  
        }//difference
        
    }//transform
}//module