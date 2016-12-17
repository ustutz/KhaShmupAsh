package shmup.nodes;
import ash.core.Node;
import shmup.components.Motion;
import shmup.components.KeyControls;
import shmup.components.Position;
import shmup.components.Size;

/**
 * ...
 * @author Urs Stutz
 */
class MotionControlNode extends Node<MotionControlNode> {

	public var keyControls:KeyControls;
	public var position:Position;
	public var size:Size;
	public var motion:Motion;
	
}