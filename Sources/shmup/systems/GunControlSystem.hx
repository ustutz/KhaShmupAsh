package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.EntityCreator;
import shmup.nodes.GunControlNode;

/**
 * ...
 * @author Urs Stutz
 */
class GunControlSystem extends ListIteratingSystem<GunControlNode> {
	
	var creator:EntityCreator;

	public function new( creator:EntityCreator ) {
		
		super( GunControlNode, updateNode );
		this.creator = creator;
	}
	
	function updateNode( node:GunControlNode, time:Float ):Void {
		
		var keyStates = node.keyStates;
		var gun = node.gun;
		var position = node.position;
		var size = node.size;
		
		gun.cooldownLeft -= time;
		
		if ( keyStates.shoot && gun.cooldownLeft <= 0 ) {
			
			creator.createBullet( position, size.width );
			gun.cooldownLeft = gun.shotInterval;
		}
	}
	
}