package shmup.nodes;
import ash.core.Node;
import shmup.components.Hitbox;
import shmup.components.Position;
import shmup.components.types.Spaceship;

/**
 * ...
 * @author Urs Stutz
 */
class PlayerCollisionNode extends Node<PlayerCollisionNode> {

	public var spaceship:Spaceship;
	public var position:Position;
	public var hitbox:Hitbox;
	
}