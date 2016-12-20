package shmup.nodes;
import ash.core.Node;
import shmup.components.TextContent;
import shmup.components.types.Score;

/**
 * ...
 * @author Urs Stutz
 */
class ScoreNode extends Node<ScoreNode> {

	public var score:Score;
	public var textContent:TextContent;
}