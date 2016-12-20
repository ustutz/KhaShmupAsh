package shmup.systems;
import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;
import kha.audio1.Audio;
import shmup.EntityCreator;
import shmup.components.Hitbox;
import shmup.components.Position;
import shmup.components.types.Score;
import shmup.nodes.BulletCollisionNode;
import shmup.nodes.EnemyCollisionNode;
import shmup.nodes.ScoreNode;

/**
 * ...
 * @author Urs Stutz
 */
class CollisionSystem extends System {
	
	var creator:EntityCreator;
	
	var bullets:NodeList<BulletCollisionNode>;
	var enemies:NodeList<EnemyCollisionNode>;
	var scores:NodeList<ScoreNode>;

	public function new( creator:EntityCreator ) {
		
		super();
		this.creator = creator;
		
	}
	
	override public function addToEngine( engine:Engine ):Void {
		
		bullets = engine.getNodeList( BulletCollisionNode );
		enemies = engine.getNodeList( EnemyCollisionNode );
		scores = engine.getNodeList( ScoreNode );
	}
	
	override public function removeFromEngine( engine:Engine ):Void {
		
		bullets = null;
		enemies = null;
		scores = null;
	}
	
	override public function update( time:Float ):Void {
		
		for ( bulletNode in bullets ) {
			for ( enemyNode in enemies ) {
				if ( overlaps( bulletNode.position, bulletNode.hitbox, enemyNode.position, enemyNode.hitbox )) {
					
					Audio.play( enemyNode.explosionSound.sound, false );
					
					creator.destroyEntity( bulletNode.entity );
					enemyNode.enemy.esm.changeState( "exploding" );
					increaseScore();
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
	
	function increaseScore():Void {
		
		for ( scoreNode in scores ) {
			
			var score = scoreNode.score;
			
			score.points++;
			scoreNode.textContent.text = score.scoreText + Std.string( score.points );
		}
	}
}