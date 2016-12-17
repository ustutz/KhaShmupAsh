package shmup;
import ash.core.Engine;
import ash.core.Entity;
import kha.Assets;
import kha.math.FastVector2;
import shmup.components.Display;
import shmup.components.GameState;
import shmup.components.KeyStates;
import shmup.components.ControlsMotion;
import shmup.components.Position;
import shmup.components.Size;
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
		.add( new Display( playerShip ))
		.add( new Position( new FastVector2( centerX, centerY ), 0 ))
		.add( new Size( playerShip.width, playerShip.height ))
		.add( new ControlsMotion( 200, 200 ))
		.add( keyStates )
		.add( new Spaceship() );
		
		engine.addEntity( spaceshipEntity );
		return spaceshipEntity;
	}
	
}