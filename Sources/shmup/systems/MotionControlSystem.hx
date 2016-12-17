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
		
		var control = node.keyStates;
		var position = node.position;
		var size = node.size;
		var controlsMotion = node.controlsMotion;
		
		if ( control.left ) {
			
			position.translation.x -= controlsMotion.velocity.x * time;
			
			if ( position.translation.x < 0 ) {
				position.translation.x = 0;
			}
		}
		
		if ( control.right ) {
			
			position.translation.x += controlsMotion.velocity.x * time;
			
			if ( position.translation.x > config.width - size.width ) {
				position.translation.x = config.width - size.width;
			}
		}
		
		if ( control.up ) {
			
			position.translation.y -= controlsMotion.velocity.y * time;
			
			if ( position.translation.y < 0 ) {
				position.translation.y = 0;
			}
		}
		
		if ( control.down ) {
			
			position.translation.y += controlsMotion.velocity.y * time;
			
			if ( position.translation.y > config.height - size.height ) {
				position.translation.y = config.height - size.height;
			}
		}
		
	}
}