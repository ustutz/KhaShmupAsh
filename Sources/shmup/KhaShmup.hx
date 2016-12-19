package shmup;

import ash.core.Engine;
import ashKha.tick.KhaFrameTickProvider;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.Scheduler;
import kha.System;
import kha.input.Keyboard;
import shmup.KeyListener;
import shmup.EntityCreator;
import shmup.GameConfig;
import shmup.components.KeyStates;
import shmup.systems.AnimationSystem;
import shmup.systems.CollisionSystem;
import shmup.systems.EnemySpawnerSystem;
import shmup.systems.GameManager;
import shmup.systems.GunControlSystem;
import shmup.systems.MotionControlSystem;
import shmup.systems.MovementSystem;
import shmup.systems.RenderSystem;
import shmup.systems.ScreenClippingSystem;
import shmup.systems.SystemPriorities;

class KhaShmup {
	
	var screenWidth:Int;
	var screenHeight:Int;
	
	var engine:Engine;
	var creator:EntityCreator;
	var config:GameConfig;
	var keyListener:KeyListener;
	
	var tickProvider:KhaFrameTickProvider;
	
	var initialized = false;

	public function new( screenWidth:Int, screenHeight:Int ) {
		
		this.screenHeight = screenHeight;
		this.screenWidth = screenWidth;
	}
	
	public function init():Void {
		
		engine = new Engine();
		config = new GameConfig( screenWidth, screenHeight, Color.fromValue( 0x26004d ));
		var keyStates = new KeyStates();
		
		creator = new EntityCreator( engine, config, keyStates );
		creator.createGamestate();
		creator.createEnemySpawner( config );
		
		// create a buffer to draw to
		var backbuffer = Image.createRenderTarget( screenWidth, screenHeight );
		var renderSystem = new RenderSystem( config, backbuffer );
		
		engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
		engine.addSystem( new EnemySpawnerSystem( creator, config ), SystemPriorities.update );
		engine.addSystem( new MotionControlSystem( config ), SystemPriorities.update );
		engine.addSystem( new GunControlSystem( creator ), SystemPriorities.update );
		engine.addSystem( new MovementSystem( config ), SystemPriorities.update );
		engine.addSystem( new ScreenClippingSystem( creator, config ), SystemPriorities.resolveCollisions );
		engine.addSystem( new CollisionSystem( creator ), SystemPriorities.resolveCollisions );
		engine.addSystem( new AnimationSystem( creator ), SystemPriorities.animate );
		engine.addSystem( renderSystem, SystemPriorities.render );
		
		System.notifyOnRender( renderSystem.setFramebuffer );
		
		keyListener = new KeyListener( keyStates );
		Keyboard.get().notify( keyListener.keyDown, keyListener.keyUp );

	}
	
	public function start():Void { //trace( "start" );
		
		tickProvider = new KhaFrameTickProvider( 60 );
		tickProvider.add( engine.update );
		tickProvider.start();
	}

}
