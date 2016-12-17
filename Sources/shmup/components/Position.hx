package shmup.components;

import kha.FastFloat;
import kha.math.FastVector2;

class Position {
    
	public var translation:FastVector2;
    public var rotation:FastFloat;

    public function new( translation:FastVector2, rotation:FastFloat ) {
        this.translation = translation;
        this.rotation = rotation;
    }
}
