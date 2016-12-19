package shmup.nodes;
import ash.core.Node;
import shmup.components.Hitbox;
import shmup.components.Position;
import shmup.components.types.Enemy;

/**
 * ...
 * @author Urs Stutz
 */
class EnemyCollisionNode extends Node<EnemyCollisionNode> {

	public var enemy:Enemy;
	public var position:Position;
	public var hitbox:Hitbox;
	
}