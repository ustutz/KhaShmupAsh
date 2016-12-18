package shmup.components;

import kha.FastFloat;
import kha.math.FastVector2;

class Position {
    
	public var translation:FastVector2;

    public function new( translation:FastVector2 ) {
        this.translation = translation;
    }
}
