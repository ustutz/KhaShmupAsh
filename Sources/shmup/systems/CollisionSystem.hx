package shmup.systems;
import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;
import kha.audio1.Audio;
import shmup.EntityCreator;
import shmup.components.Hitbox;
import shmup.components.Position;
import shmup.nodes.BulletCollisionNode;
import shmup.nodes.EnemyCollisionNode;

/**
 * ...
 * @author Urs Stutz
 */
class CollisionSystem extends System {
	
	var creator:EntityCreator;
	
	var bullets:NodeList<BulletCollisionNode>;
	var enemies:NodeList<EnemyCollisionNode>;

	public function new( creator:EntityCreator ) {
		
		super();
		this.creator = creator;
		
	}
	
	override public function addToEngine( engine:Engine ):Void {
		
		bullets = engine.getNodeList( BulletCollisionNode );
		enemies = engine.getNodeList( EnemyCollisionNode );
	}
	
	override public function removeFromEngine( engine:Engine ):Void {
		
		bullets = null;
		enemies = null;
	}
	
	override public function update( time:Float ):Void {
		
		for ( bullet in bullets ) { //trace( "bullet" );
			for ( enemy in enemies ) { //trace( "enemy" );
				if ( overlaps( bullet.position, bullet.hitbox, enemy.position, enemy.hitbox )) {
					
					Audio.play( enemy.explosionSound.sound, false );
					
					creator.destroyEntity( bullet.entity );
					creator.destroyEntity( enemy.entity );
					break;
				}
			}
		}
	}
	
	function overlaps( position1:Position, hitbox1:Hitbox, position2:Position, hitbox2:Hitbox ):Bool {
		
		var x1 = position1.x + hitbox1.offsetX;
		var y1 = position1.y + hitbox1.offsetY;
		
		var x2 = position2.x + hitbox2.offsetX;
		var y2 = position2.y + hitbox2.offsetY;
		
		return 	x1 <= x2 + hitbox2.width && 
				x1 + hitbox1.width >= x2 && 
				y1 <= y2 + hitbox2.height && 
				y1 + hitbox1.height >= y2;
  }
}