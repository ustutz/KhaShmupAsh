package shmup;

/**
 * ...
 * @author Urs Stutz
 */
class GameConfig {

	public var width:Int;
	public var height:Int;
	public var bgColor:Int;
	
	public function new( width:Int, height:Int, bgColor:Int ) {
		
		this.width = width;
		this.height = height;
		this.bgColor = bgColor;
	}
	
}