package shmup.components;
import kha.Sound;

/**
 * ...
 * @author Urs Stutz
 */
class ExplosionSound {
	
	public var sound:Sound;

	public function new( sound:Sound = null ) {
		
		this.sound = ( sound == null ) ? new Sound() : sound;
	}
	
}