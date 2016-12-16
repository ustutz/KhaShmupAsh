package shmup;

/**
 * ...
 * @author Urs Stutz
 */
class GameConfig {

	public var width:Float;
	public var height:Float;
	public var bgColor:Int;
	
	public function new( width:Float, height:Float, bgColor:Int ) {
		
		this.width = width;
		this.height = height;
		this.bgColor = bgColor;
	}
	
}