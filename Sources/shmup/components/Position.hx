package shmup.components;

import kha.FastFloat;
import kha.math.FastVector2;

class Position {
    
	public var x:FastFloat;
	public var y:FastFloat;

    public function new( x:FastFloat = 0, y:FastFloat = 0 ) {
		this.x = x;
		this.y = y;
    }
}
