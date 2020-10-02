include <../lib/lib.scad>
include <./components.scad>


//camStereoHolder_RPiCam(ry=90, stereoBase=60);
camStereoHolder_ws_IMX219_Stereo(ry=90);                      //https://www.waveshare.com/wiki/IMX219-83_Stereo_Camera
//camStereoHolder_MCAM400_x2(ry=90, stereoBase=64);            //http://wiki.friendlyarm.com/wiki/index.php/Matrix_-_MCAM400

module camStereoHolder_RPiCam(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6, length=20, mX=4, stereoBase=64){
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
                yPoly([[3,0],[0.4,5],[-0.4,5],[-3,0]],_sb+27,   length,3,-((_sb+27)/2), 0,0,90);
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

module camStereoHolder_ws_IMX219_Stereo(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6, length=20, mX=4){
    _tk=thickness;
    _tk_2=thickness/2;
    _tk_x2=thickness*2;
    _shift=0.4;
    _r = mX/2+_shift;
    
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCube(85+2,19,2, length,0,0, 0,90,0);
                yPoly([[0,0],[-1.1,5],[-1.9,5],[-3,0]],85,   length,-2,-85/2, 0,0,90);
                yPoly([[0,0],[-1.1,5],[-1.9,5],[-3,0]],85,   length,2,85/2, 0,180,90);
                yCyl(_tk,_tk);                     
              
                
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]],
                    szz=_tk_x2, py=_tk, rx=90);        
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]], 
                    szz=_tk_x2, py=-_tk, rx=-90);                
            }//union
            yCyl(_r,_tk_x2);            
            
            //cam holes (~M2) / inner
            yCyl2(1.4,_tk,  (21/2), (13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  (21/2), (-13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  -(21/2), (13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  -(21/2), (-13.5/2),length, 0,90,0 );  
            ////cam holes (~M2.5) / outer
            yCyl2(1.4,_tk,  (21/2+30), (13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  (21/2+30), (-13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  -(21/2+30), (13.5/2),length, 0,90,0 );  
            yCyl2(1.4,_tk,  -(21/2+30), (-13.5/2),length, 0,90,0 );  
            
            //holes for cam construction
            yCyl2(3,_tk*3,  (85/2-3.5),0,(length+2.4), 0,90,0 );  
            yCyl2(3,_tk*3,  (85/2-3.5-18), 0,(length+2.4), 0,90,0 );  
            yCyl2(3,_tk*3,  -(85/2-3.5),0,(length+2.4), 0,90,0 );  
            yCyl2(3,_tk*3,  -(85/2-3.5-18), 0,(length+2.4), 0,90,0 );  
            
            
        }//difference
        
    }//transform
}//module

module camStereoHolder_MCAM400_x2(px=0, py=0, pz=0, rx=0, ry=0, rz=0, thickness=6, length=20, mX=4, stereoBase=64){
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
                yCube(_sb+39,39,2, length,0,0, 0,90,0);                
                yCyl(_tk,_tk);                     
              
                
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]],
                    szz=_tk_x2, py=_tk, rx=90);        
                yPoly(p=[[0,0],[length-_tk_x2,0],[length-_tk,_tk_2+_shift],[length,_tk_2+_shift],[length,_tk+_shift],[length-_tk,_tk+_shift],[length-_tk_x2,_tk_2],[0,_tk_2]], 
                    szz=_tk_x2, py=-_tk, rx=-90);                
            }//union
            yCyl(_r,_tk_x2);            
            
            //cam holes (~2.5)
            yCyl2(1.5,_tk,  _sb_2+16.5,16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  _sb_2+16.5,-16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  _sb_2-16.5,16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  _sb_2-16.5,-16.5, length, 0,90,0 );              
            
            yCyl2(1.5,_tk,  -_sb_2+16.5,16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  -_sb_2+16.5,-16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  -_sb_2-16.5,16.5, length, 0,90,0 );  
            yCyl2(1.5,_tk,  -_sb_2-16.5,-16.5, length, 0,90,0 );  
            
            //cams
            //yCyl2(7.5,_tk,  _sb_2,0, length, 0,90,0 );  
            //yCyl2(7.5,_tk,  -_sb_2,0, length, 0,90,0 );
            yCube(8,24,24,     length,0, _sb_2);
            yCube(8,24,24,     length,0, -_sb_2);
            
        }//difference
        
    }//transform
}//module
