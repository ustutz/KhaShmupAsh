package shmup;
import ash.core.Engine;
import ash.core.Entity;
import ash.tools.ComponentPool;
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
		
		if ( entity.has( Position )) {
			ComponentPool.dispose( entity.get( Position ));
		}
		if ( entity.has( Size )) {
			ComponentPool.dispose( entity.get( Size ));
		}
		if ( entity.has( Motion )) {
			ComponentPool.dispose( entity.get( Motion ));
		}
		if ( entity.has( Display )) {
			ComponentPool.dispose( entity.get( Display ));
		}
		if ( entity.has( Bullet )) {
			ComponentPool.dispose( entity.get( Bullet ));
		}
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
		.add( new Position( centerX, centerY ))
		.add( new Size( playerShip.width, playerShip.height ))
		.add( new Controls( 200.0, 200.0 ))
		.add( keyStates )
		.add( new Gun( 0.3 ))
		.add( new Display( playerShip ))
		.add( new Spaceship() );
		
		engine.addEntity( spaceshipEntity );
		return spaceshipEntity;
	}
	
	public function createBullet( parentPosition:Position, parentWidth:Int ):Entity { //trace( "createBullet" );
		
		var bullet = Assets.images.laserShot;
		
		var position = ComponentPool.get( Position );
		position.x = parentPosition.x + parentWidth / 2 - bullet.width / 2;
		position.y = parentPosition.y - bullet.height;
		
		var size = ComponentPool.get( Size );
		size.width = bullet.width;
		size.height = bullet.height;
		
		var motion = ComponentPool.get( Motion );
		motion.x = 0;
		motion.y = -600;
		
		var display = ComponentPool.get( Display );
		display.image = bullet;
		
		var bulletEntity = new Entity()
		.add( position )
		.add( size )
		.add( motion )
		.add( display )
		.add( ComponentPool.get( Bullet ));
		
		engine.addEntity( bulletEntity );
		
		return bulletEntity;
	}
	
}