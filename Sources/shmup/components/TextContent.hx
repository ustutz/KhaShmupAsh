package shmup.components;

/**
 * ...
 * @author Urs Stutz
 */
class TextContent {
	
	public var text:String;
	public var align:TAlign;

	public function new( text:String = "", align:TAlign = null ) {
		this.text = text;
		this.align = ( align == null ) ? TAlign.Left : align;
	}
	
}