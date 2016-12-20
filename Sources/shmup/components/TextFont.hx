package shmup.components;
import kha.FastFloat;
import kha.Font;

/**
 * ...
 * @author Urs Stutz
 */
class TextFont {
	
	public var font:Font;
	public var fontSize:Int;

	public function new( font:Font, fontSize:Int ) {
		
		this.font = font;
		this.fontSize = fontSize;
	}
	
}