package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.EntityCreator;
import shmup.GameConfig;
import shmup.nodes.ScreenClippingNode;

/**
 * ...
 * @author Urs Stutz
 */
class ScreenClippingSystem extends ListIteratingSystem<ScreenClippingNode> {
	
	var creator:EntityCreator;
	var config:GameConfig;

	public function new( creator:EntityCreator, config:GameConfig ) {
		
		super(ScreenClippingNode, updateNode);
		this.creator = creator;
		this.config = config;
	}
	
	public function updateNode( node:ScreenClippingNode, time:Float ):Void {
		
		var position = node.position;
		var size = node.size;
		var motion = node.motion;
		
		if ( motion.x < 0 ) {
			if ( position.x + size.width < 0 ) {
				creator.destroyEntity( node.entity );
			}
		} else if ( motion.x > 0 ) {
			if ( position.x > config.width ) {
				creator.destroyEntity( node.entity );
			}
		}
		
		if ( motion.y < 0 ) {
			if ( position.y + size.height < 0 ) {
				creator.destroyEntity( node.entity );
			}
		} else if ( motion.y > 0 ) {
			if ( position.y > config.height ) {
				creator.destroyEntity( node.entity );
			}
		}
		
	}
}