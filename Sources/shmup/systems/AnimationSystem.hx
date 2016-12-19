package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.EntityCreator;
import shmup.components.Animation;
import shmup.components.Display;
import shmup.components.PlayState;
import shmup.nodes.AnimationNode;

/**
 * ...
 * @author Urs Stutz
 */
class AnimationSystem extends ListIteratingSystem<AnimationNode> {
	
	var creator:EntityCreator;

	public function new( creator:EntityCreator ) {
		
		super( AnimationNode, updateNode );
		this.creator = creator;
		
	}
	
	function updateNode( node:AnimationNode, time:Float ):Void {
		
		var animation = node.animation;
		var display = node.display;
		
		animation.currentTime += time;
		
		if ( animation.currentTime >= animation.frameDuration ) {
			
			animation.currentTime = 0;
			
			if ( animation.index < animation.frames.length ) {
				
				updateAnimationFrame( animation, display );
				return;
			}
			
			if ( animation.playState == PlayState.Loop ) {
				
				animation.index = 0;
				updateAnimationFrame( animation, display );
				return;
			}
			
			creator.destroyEntity( node.entity );
		}
	}
	
	function updateAnimationFrame( animation:Animation, display:Display ):Void {
		
		display.image = animation.frames[ animation.index ];
		animation.index++;
	}
}