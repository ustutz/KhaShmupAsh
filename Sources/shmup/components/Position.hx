package shmup.components;

import kha.FastFloat;
import kha.math.FastVector3;

class Position {
    
	public var position:FastVector3;
    public var rotation:FastFloat;

    public function new( position:FastVector3, rotation:FastFloat ) {
        this.position = position;
        this.rotation = rotation;
    }
}
