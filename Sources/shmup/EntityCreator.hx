package shmup;
import ash.core.Engine;
import ash.core.Entity;
import kha.Assets;
import kha.math.FastVector2;
import shmup.components.Display;
import shmup.components.GameState;
import shmup.components.Position;
import shmup.components.types.Spaceship;

/**
 * ...
 * @author Urs Stutz
 */
class EntityCreator {
	
	var engine:Engine;

	public function new( engine:Engine ) {
		this.engine = engine;
	}
	
	public function destroyEntity( entity:Entity ):Void {
		engine.removeEntity( entity );
	}
	
	public function createGamestate():Entity { //trace( "createGamestate" );
		
		var gameEntity = new Entity();
		gameEntity.add( new GameState() );
		engine.addEntity( gameEntity );

		return gameEntity;
	}
	
	public function createSpaceship( x:Float, y:Float ):Entity { //trace( "createSpaceship" );
		
		var spaceshipEntity = new Entity();
		spaceshipEntity.add( new Display( Assets.images.playerShip ));
		spaceshipEntity.add( new Position( new FastVector2( 300, 500 ), 0 ));
		spaceshipEntity.add( new Spaceship() );
		
		engine.addEntity( spaceshipEntity );
		return spaceshipEntity;
	}
}