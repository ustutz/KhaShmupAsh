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
		
		super(MovementNode, updateNode);
		this.config = config;
		
	}
	
	function updateNode( node:MovementNode, time:Float ):Void {
		
		var position = node.position;
		var motion = node.motion;
		
		position.x += motion.x * time;
		position.y += motion.y * time;
		
	}
}