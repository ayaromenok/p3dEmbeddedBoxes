include <../lib/lib.scad>
include <./components.scad>

waveshareCM_IO();

module waveshareCM_IO(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx,ry,rz]){
        yCube(164.9,124.31,20);    
    
    }//transform
}//module waveshareCM_IO

