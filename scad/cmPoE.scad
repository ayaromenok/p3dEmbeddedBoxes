include <./components_v2.scad>
include <./boxParts_v2.scad>

//include <./components.scad>
g_isProduction = true; //true to avoid displaying test components
rpiCmPoE(0,0, height=5, thickness=3);


module rpiCmPoE(px=0, py=0, pz=0, rx=0, ry=0, rz=0, height=22, isExtHolders = false, thickness=3){
    w = 114;      //width
    d = 84.4;     //depth
    h = height;    
    t = thickness;
    h_2 = h/2;
    w_2 = w/2;
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){            
                difference(){
                    minkowski(){
                        yCube(111,81.4,(height-1));
                        yCyl(2+thickness,1);
                    }//mink
                    translate([0,0,thickness])
                    minkowski(){
                        yCube(111,81.4,(height-1));
                        yCyl(2,1);
                    }//mink
                    yCube(w/3.5, d*4/5,t*2,   w/3);
                    yCube(w/3.5, d*4/5,t*2,   -w/3);
                    yCube(w/3, d*0.9,t*2,   0);
                }//diff
                
                //board support connectors
                yCyl(4,3,    106/2,76.4/2,-h_2+t);
                yCyl(4,3,    106/2,-76.4/2,-h_2+t);
                yCyl(4,3,    -106/2,76.4/2,-h_2+t);
                yCyl(4,3,    -106/2,-76.4/2,-h_2+t);
                
                //cam holder on longer side
                yCyl(10,10,  -10,-(d/2+15+t),5-h_2);
                yCube(6,10,6,   -10,-(d/2+t+5),3-h_2);
                
                //box extermal support connectors on shoter side
                yCyl(5,3,    (w_2+t+4),76.4/2,(-h_2+1.5));
                yCyl(5,3,    (w_2+t+4),-76.4/2,(-h_2+1.5));
                yCyl(5,3,    -(w_2+t+4),76.4/2,(-h_2+1.5));
                yCyl(5,3,    -(w_2+t+4),-76.4/2,(-h_2+1.5));
            }//union
            //board connectors
            yCyl(1.8,10,    106/2,76.4/2,-h_2+t);
            yCyl(1.8,10,    106/2,-76.4/2,-h_2+t);
            yCyl(1.8,10,    -106/2,76.4/2,-h_2+t);
            yCyl(1.8,10,    -106/2,-76.4/2,-h_2+t);
            //holes for board connectors nuts
            yCyl(rb=3.8, rt=2.6, szz=t,    px=106/2,py=76.4/2,pz=(-h_2+t/2-0.01));
            yCyl(rb=3.8, rt=2.6, szz=t,    px=106/2,py=-76.4/2,pz=(-h_2+t/2-0.01));
            yCyl(rb=3.8, rt=2.6, szz=t,    px=-106/2,py=76.4/2,pz=(-h_2+t/2-0.01));
            yCyl(rb=3.8, rt=2.6, szz=t,    px=-106/2,py=-76.4/2,pz=(-h_2+t/2-0.01));
            
            //cam holder on longer side
            yCyl(2.3,20,  -10,-(d/2+15+t),5-h_2);
            yCyl(rb=7,rt=5,szz=6,  px=-10,py=-(d/2+15+t),pz=2.9-h_2);
            
            //box extermal support connectors on shoter side
            yCyl(2.4,6,    (w_2+t+4),76.4/2,(-h_2+1.5));
            yCyl(2.4,6,    (w_2+t+4),-76.4/2,(-h_2+1.5));
            yCyl(2.4,6,    -(w_2+t+4),76.4/2,(-h_2+1.5));
            yCyl(2.4,6,    -(w_2+t+4),-76.4/2,(-h_2+1.5));
        }//difference
        
        
        
    }//translate
}//module rpi3ABot
