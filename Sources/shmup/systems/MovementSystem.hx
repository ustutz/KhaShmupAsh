package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.nodes.MovementNode;

/**
 * ...
 * @author Urs Stutz
 */
class MovementSystem extends ListIteratingSystem<MovementNode> {
	
	var config:GameConfig;

	public function new( config:GameConfig ) {
		
		this.config = config;
		super(MovementNode, updateNode);
		
	}
	
	function updateNode( node:MovementNode, time:Float ):Void {
		
		var position = node.position;
		var motion = node.motion;
		
		position.translation.x += motion.velocity.x * time;
		position.translation.y += motion.velocity.y * time;
		
	}
}