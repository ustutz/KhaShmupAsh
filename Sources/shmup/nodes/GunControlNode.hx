package shmup.nodes;
import ash.core.Node;
import shmup.components.KeyStates;
import shmup.components.Position;
import shmup.components.Size;
import shmup.components.types.Gun;
/**
 * ...
 * @author Urs Stutz
 */
class GunControlNode extends Node<GunControlNode> {

	public var keyStates:KeyStates;
	public var gun:Gun;
	public var position:Position;
	public var size:Size;
}