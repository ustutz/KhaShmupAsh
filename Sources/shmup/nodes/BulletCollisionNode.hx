package shmup.nodes;
import ash.core.Node;
import shmup.components.Hitbox;
import shmup.components.Position;
import shmup.components.types.Bullet;

/**
 * ...
 * @author Urs Stutz
 */
class BulletCollisionNode extends Node<BulletCollisionNode> {

	public var bullet:Bullet;
	public var position:Position;
	public var hitbox:Hitbox;
	
}