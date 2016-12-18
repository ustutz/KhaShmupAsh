package shmup.components;

/**
 * ...
 * @author Urs Stutz
 */
class KeyStates {
	
	public var left:Bool;
	public var right:Bool;
	public var up:Bool;
	public var down:Bool;
	public var shoot:Bool;

	public function new( left = false, right = false, up = false, down = false, shoot = false ) {
		
		this.left = left;
		this.right = right;
		this.up = up;
		this.down = down;
		this.shoot = shoot;
		
	}
	
}