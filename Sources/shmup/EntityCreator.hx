package shmup;
import ash.core.Engine;
import ash.core.Entity;
import ash.fsm.EntityStateMachine;
import ash.tools.ComponentPool;
import kha.Assets;
import kha.FastFloat;
import kha.Image;
import kha.math.FastVector2;
import shmup.components.Animation;
import shmup.components.Display;
import shmup.components.ExplosionSound;
import shmup.components.Hitbox;
import shmup.components.KeyStates;
import shmup.components.Controls;
import shmup.components.Motion;
import shmup.components.TAlign;
import shmup.components.TGameState;
import shmup.components.TPlayState;
import shmup.components.Position;
import shmup.components.Size;
import shmup.components.TextContent;
import shmup.components.TextFont;
import shmup.components.types.Bullet;
import shmup.components.types.Enemy;
import shmup.components.types.EnemySpawner;
import shmup.components.types.GameState;
import shmup.components.types.Gun;
import shmup.components.types.KeyInput;
import shmup.components.types.Score;
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
		
		if ( entity.has( Enemy )) {
			ComponentPool.dispose( entity.get( Enemy ));
		}
		if ( entity.has( Bullet )) {
			ComponentPool.dispose( entity.get( Bullet ));
		}
		
	}
	
	public function createGamestate():Entity { //trace( "createGamestate" );
		
		var gameEntity = new Entity()
		.add( new GameState( TGameState.MainMenu ));
		
		engine.addEntity( gameEntity );

		return gameEntity;
	}
	
	public function createTitle():Void {
		
		var titleEntity = new Entity()
		.add( new Position( 0, 60 ))
		.add( new TextFont( Assets.fonts.space_age, 60 ))
		.add( new TextContent( "KhaShmup Ash", TAlign.Center ));
		
		engine.addEntity( titleEntity );
		
		
		var keysEntity = new Entity()
		.add( new Position( 0, config.height - 130 ))
		.add( new TextFont( Assets.fonts.space_age, 26 ))
		.add( new TextContent( "Arrow Keys to move, Z key to shoot.", TAlign.Center ));
		
		engine.addEntity( keysEntity );
		
		
		var startEntity = new Entity()
		.add( new Position( 0, config.height - 100 ))
		.add( new TextFont( Assets.fonts.space_age, 26 ))
		.add( keyStates )
		.add( new KeyInput() )
		.add( new TextContent( "Press Z to start.", TAlign.Center ));
		
		engine.addEntity( startEntity );
		
	}
	
	public function createScore():Entity {
		
		var scoreText = "Score: ";
		var startPoints = 0;
		
		var scoreEntity = new Entity()
		.add( new Position( 10, 10 ))
		.add( new TextFont( Assets.fonts.space_age, 20 ))
		.add( new TextContent( scoreText + Std.string( startPoints )))
		.add( new Score( scoreText, startPoints ));
		
		engine.addEntity( scoreEntity );
		
		return scoreEntity;
		
	}
	
	public function createSpaceship( x:Float, y:Float ):Entity { //trace( "createSpaceship" );
		
		var playerShip = Assets.images.playerShip;
		var gunSound = Assets.sounds.bulletShoot;
		
		var startX = config.width / 2 - playerShip.width / 2;
		var startY = config.height - playerShip.height - 40;
		
		var spaceshipEntity = new Entity()
		.add( new Position( startX, startY ))
		.add( new Size( playerShip.width, playerShip.height ))
		.add( new Controls( 200.0, 200.0 ))
		.add( keyStates )
		.add( new Gun( gunSound, 0.3 ))
		.add( new Display( playerShip ))
		.add( new Spaceship() );
		
		engine.addEntity( spaceshipEntity );
		return spaceshipEntity;
	}
	
	public function createBullet( parentPosition:Position, parentWidth:Int ):Entity { //trace( "createBullet" );
		
		var bullet = Assets.images.bullet;
		
		var position = ComponentPool.get( Position );
		position.x = parentPosition.x + parentWidth / 2 - bullet.width / 2;
		position.y = parentPosition.y - bullet.height;
		
		var size = ComponentPool.get( Size );
		size.width = bullet.width;
		size.height = bullet.height;
		
		var hitbox = ComponentPool.get( Hitbox );
		hitbox.offsetX = 0;
		hitbox.offsetY = 0;
		hitbox.width = bullet.width;
		hitbox.height = bullet.height;
		
		var motion = ComponentPool.get( Motion );
		motion.x = 0;
		motion.y = -600;
		
		var display = ComponentPool.get( Display );
		display.image = bullet;
		
		var bulletEntity = new Entity()
		.add( position )
		.add( size )
		.add( hitbox )
		.add( motion )
		.add( display )
		.add( ComponentPool.get( Bullet ));
		
		engine.addEntity( bulletEntity );
		
		return bulletEntity;
	}
	
	public function createEnemySpawner( config:GameConfig ):Entity {
		
		var explosionFrames = new Array<Image>();
		explosionFrames.push( Assets.images.smokeOrange0 );
		explosionFrames.push( Assets.images.smokeOrange1 );
		explosionFrames.push( Assets.images.smokeOrange2 );
		explosionFrames.push( Assets.images.smokeOrange3 );
		
		var enemySpawnerEntity = new Entity()
		.add( new EnemySpawner( Assets.images.enemyShip, explosionFrames, 1, 3, 0, config.width, config.height ));
		
		engine.addEntity( enemySpawnerEntity );
		
		return enemySpawnerEntity;
	}
	
	public function createEnemy( x:FastFloat, y:FastFloat, enemyImage:Image, explosionFrames:Array<Image> ):Entity {
		
		var position = ComponentPool.get( Position );
		position.x = x;
		position.y = y;
		
		var size = ComponentPool.get( Size );
		size.width = enemyImage.width;
		size.height = enemyImage.height;
		
		var hitbox = ComponentPool.get( Hitbox );
		hitbox.offsetX = 2;
		hitbox.offsetY = 0;
		hitbox.width = enemyImage.width -4;
		hitbox.height = Std.int( enemyImage.height / 2 );
		
		var motion = ComponentPool.get( Motion );
		motion.x = 0;
		motion.y = 200;
		
		var display = ComponentPool.get( Display );
		display.image = enemyImage;
		
		var explosionSound = ComponentPool.get( ExplosionSound );
		explosionSound.sound = Assets.sounds.enemyExplosion;
		
		var explosionAnimation = ComponentPool.get( Animation );
		explosionAnimation.frameDuration = 0.1;
		explosionAnimation.frames = explosionFrames;
		
		
		var enemyEntity = new Entity();
		var esm = new EntityStateMachine( enemyEntity );
		
		esm.createState( "playing" )
		.add( Hitbox ).withInstance( hitbox )
		.add( Motion ).withInstance( motion )
		.add( ExplosionSound ).withInstance( explosionSound );
		
		esm.createState( "exploding" )
		.add( Animation ).withInstance( explosionAnimation );
		
		enemyEntity
		.add( position )
		.add( size )
		.add( display )
		.add( new Enemy( esm ));
		
		esm.changeState( "playing" );
		engine.addEntity( enemyEntity );
		
		return enemyEntity;
		
	}
}