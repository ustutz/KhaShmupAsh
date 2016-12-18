package shmup;
import ash.core.Engine;
import ash.core.Entity;
import kha.Assets;
import kha.FastFloat;
import kha.math.FastVector2;
import shmup.components.Display;
import shmup.components.GameState;
import shmup.components.KeyStates;
import shmup.components.Controls;
import shmup.components.Motion;
import shmup.components.Position;
import shmup.components.Size;
import shmup.components.types.Bullet;
import shmup.components.types.Gun;
import shmup.components.types.Spaceship;

/**
 * ...
 * @author Urs Stutz
 */
class EntityCreator {
	
	var engine:Engine;
	var config:GameConfig;
	var keyStates:KeyStates;

	public function new( engine:Engine, config:GameConfig, keyStates:KeyStates ) {
		
		this.engine = engine;
		this.config = config;
		this.keyStates = keyStates;
	}
	
	public function destroyEntity( entity:Entity ):Void {
		engine.removeEntity( entity );
	}
	
	public function createGamestate( ):Entity { //trace( "createGamestate" );
		
		var gameEntity = new Entity()
		.add( new GameState() );
		
		engine.addEntity( gameEntity );

		return gameEntity;
	}
	
	public function createSpaceship( x:Float, y:Float ):Entity { //trace( "createSpaceship" );
		
		var playerShip = Assets.images.playerShip;
		
		var centerX = config.width / 2 - playerShip.width / 2;
		var centerY = config.height / 2 - playerShip.height / 2;
		
		var spaceshipEntity = new Entity()
		.add( new Position( new FastVector2( centerX, centerY )))
		.add( new Size( playerShip.width, playerShip.height ))
		.add( new Controls( new FastVector2( 200, 200 )))
		.add( keyStates )
		.add( new Gun( 0.3 ))
		.add( new Display( playerShip ))
		.add( new Spaceship() );
		
		engine.addEntity( spaceshipEntity );
		return spaceshipEntity;
	}
	
	public function createBullet( parentPosition:FastVector2, parentWidth:Int ):Entity { //trace( "createBullet" );
		
		var bullet = Assets.images.laserShot;
		
		var bulletEntity = new Entity()		
		.add( new Position( new FastVector2( parentPosition.x + parentWidth / 2 - bullet.width / 2, parentPosition.y - bullet.height )))
		.add( new Size( bullet.width, bullet.height ))
		.add( new Motion( new FastVector2( 0, -600 )))
		.add( new Display( bullet ))
		.add( new Bullet() );
		
		engine.addEntity( bulletEntity );
		
		return bulletEntity;
	}
	
}