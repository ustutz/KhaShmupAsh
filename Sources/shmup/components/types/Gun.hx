package shmup.components.types;
import kha.FastFloat;

/**
 * ...
 * @author Urs Stutz
 */
class Gun {
	
	public var shotInterval:FastFloat;
	public var cooldownLeft:FastFloat;
	
	public function new( shotInterval:FastFloat ) {
		
		this.shotInterval = shotInterval;
		cooldownLeft = 0;
	}
	
}