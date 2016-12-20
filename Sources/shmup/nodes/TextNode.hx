package shmup.nodes;
import ash.core.Node;
import shmup.components.Position;
import shmup.components.TextContent;
import shmup.components.TextFont;

/**
 * ...
 * @author Urs Stutz
 */
class TextNode extends Node<TextNode> {

	public var position:Position;
	public var textFont:TextFont;
	public var textContent:TextContent;
}