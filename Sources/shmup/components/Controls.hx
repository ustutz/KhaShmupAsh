package shmup.components;
import kha.FastFloat;
import kha.math.FastVector2;

/**
 * ...
 * @author Urs Stutz
 */
class Controls {
	
	public var x:FastFloat;
	public var y:FastFloat;

	public function new( x:FastFloat, y:FastFloat ) {
		
		this.x = x;
		this.y = y;
	}
	
}