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

	public function new( left:Bool = false, right:Bool = false, up:Bool = false, down:Bool = false ) {
		
		this.left = left;
		this.right = right;
		this.up = up;
		this.down = down;
		
	}
	
}