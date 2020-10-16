include <../../lib/lib2.scad>
//test use of lib2 !!

//include <./components.scad>
g_isProduction = true; //true to avoid displaying test components
JetsonNano();


module JetsonNano(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    w = 100;      //width - 100
    d = 79;     //depth 84.4
    h = 5;    
    t = 2;
    h_2 = h/2;
    w_2 = w/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yMinkCubeCyl(w+t,d+t,h, r=2);
                //board holders
                yCyl(4,h,(w/2-10),(d/2-4),2);
                yCyl(4,h,(-w/2+4),(d/2-4),2);
                yCyl(4,h,(w/2-10),(-d/2+17),2);
                yCyl(4,h,(-w/2+4),(-d/2+17),2);
                
                //external holders
                yCyl(6,3,(w/2+5),(d/2-10),-h/2+1.5);
                yCyl(6,3,(-w/2-5),(d/2-10),-h/2+1.5);
                yCyl(6,3,(w/2+5),(-d/2+10),-h/2+1.5);
                yCyl(6,3,(-w/2-5),(-d/2+10),-h/2+1.5);        
                
                //cam support
                yCyl(13,h,(-w/2-12),0,0);
                yCyl(9,h,(-w/2-16),0,2);   
            }//union
            //light construction
            yMinkCubeCyl(w/3,d-10,h+2, r=2, px=w/4-7);
            yMinkCubeCyl(w/3,d-10,h+2, r=2, px=-w/4+3);
            //holes in board holders
            yCyl(2,h*2,(w/2-10),(d/2-4));
            yCyl(2,h*2,(-w/2+4),(d/2-4));
            yCyl(2,h*2,(w/2-10),(-d/2+17));
            yCyl(2,h*2,(-w/2+4),(-d/2+17));
            //holes for nuts
            yCyl(4,h,(w/2-10),(d/2-4),-2);
            yCyl(4,h,(-w/2+4),(d/2-4),-2);
            yCyl(4,h,(w/2-10),(-d/2+17),-2);
            yCyl(4,h,(-w/2+4),(-d/2+17),-2);
            
            //holes in external holders
            yCyl(2.4,5,(w/2+5),(d/2-10),-h/2+1.3);
            yCyl(2.4,5,(-w/2-5),(d/2-10),-h/2+1.3);
            yCyl(2.4,5,(w/2+5),(-d/2+10),-h/2+1.3);
            yCyl(2.4,5,(-w/2-5),(-d/2+10),-h/2+1.3);        
            
            //cam holder
            yCyl(2.4,h*2,(-w/2-16),0,1);   
            yCyl(6,h,(-w/2-16),0,-2);
        }//diff
        
    }//translate
}//module rpi3ABot
