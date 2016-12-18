package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.GameConfig;
import shmup.nodes.MotionControlNode;

/**
 * ...
 * @author Urs Stutz
 */
class MotionControlSystem extends ListIteratingSystem<MotionControlNode> {
	
	var config:GameConfig;
	
	public function new( config:GameConfig ) {
		
		super( MotionControlNode, updateNode );
		this.config = config;
		
	}
	
	function updateNode( node:MotionControlNode, time:Float ):Void { //trace( time );
		
		var keyStates = node.keyStates;
		var position = node.position;
		var size = node.size;
		var controls = node.controls;
		
		if ( keyStates.left ) {
			
			position.x -= controls.x * time;
			
			if ( position.x < 0 ) {
				position.x = 0;
			}
		}
		
		if ( keyStates.right ) {
			
			position.x += controls.x * time;
			
			if ( position.x > config.width - size.width ) {
				position.x = config.width - size.width;
			}
		}
		
		if ( keyStates.up ) {
			
			position.y -= controls.y * time;
			
			if ( position.y < 0 ) {
				position.y = 0;
			}
		}
		
		if ( keyStates.down ) {
			
			position.y += controls.y * time;
			
			if ( position.y > config.height - size.height ) {
				position.y = config.height - size.height;
			}
		}
		
	}
}