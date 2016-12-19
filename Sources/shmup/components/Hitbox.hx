package shmup.components;
import kha.FastFloat;

/**
 * ...
 * @author Urs Stutz
 */
class Hitbox {
	
	public var offsetX:FastFloat;
	public var offsetY:FastFloat;
	public var width:FastFloat;
	public var height:FastFloat;

	public function new( offsetX:FastFloat = 0, offsetY:FastFloat = 0, width:FastFloat = 1, height:FastFloat = 1 ) {
		
		this.offsetX = offsetX;
		this.offsetY = offsetY;
		this.width = width;
		this.height = height;
		
	}
	
}