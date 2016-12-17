package shmup.nodes;
import ash.core.Node;
import shmup.components.ControlsMotion;
import shmup.components.KeyStates;
import shmup.components.Position;
import shmup.components.Size;

/**
 * ...
 * @author Urs Stutz
 */
class MotionControlNode extends Node<MotionControlNode> {

	public var keyStates:KeyStates;
	public var position:Position;
	public var size:Size;
	public var controlsMotion:ControlsMotion;
	
}