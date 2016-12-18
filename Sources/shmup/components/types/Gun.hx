package shmup.components.types;
import kha.FastFloat;
import kha.Sound;

/**
 * ...
 * @author Urs Stutz
 */
class Gun {
	
	public var sound:Sound;
	public var shotInterval:FastFloat;
	public var cooldownLeft:FastFloat;
	
	public function new( sound:Sound, shotInterval:FastFloat ) {
		
		this.sound = sound;
		this.shotInterval = shotInterval;
		cooldownLeft = 0;
	}
	
}