package shmup.components;

import kha.FastFloat;
import kha.math.FastVector3;

class Position {
    
	public var translation:FastVector3;
    public var rotation:FastFloat;

    public function new( translation:FastVector3, rotation:FastFloat ) {
        this.translation = translation;
        this.rotation = rotation;
    }
}
