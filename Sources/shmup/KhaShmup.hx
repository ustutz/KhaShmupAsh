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
import shmup.Controls;
import shmup.EntityCreator;
import shmup.GameConfig;
import shmup.components.KeyControls;
import shmup.systems.GameManager;
import shmup.systems.MotionControlSystem;
import shmup.systems.RenderSystem;
import shmup.systems.SystemPriorities;

class KhaShmup {
	
	var screenWidth:Int;
	var screenHeight:Int;
	
	var engine:Engine;
	var creator:EntityCreator;
	var config:GameConfig;
	var tickProvider:KhaFrameTickProvider;
	
	var initialized = false;
	var controls:Controls;

	public function new( screenWidth:Int, screenHeight:Int ) {
		
		this.screenHeight = screenHeight;
		this.screenWidth = screenWidth;
	}
	
	public function init():Void {
		
		engine = new Engine();
		config = new GameConfig( screenWidth, screenHeight, Color.fromValue( 0x26004d ));
		
		var keyControls = new KeyControls();
		controls = new Controls( keyControls );
		Keyboard.get().notify( controls.keyDown, controls.keyUp );
		
		creator = new EntityCreator( engine, config, keyControls );
		
		// create a buffer to draw to
		var backbuffer = Image.createRenderTarget( screenWidth, screenHeight );
		var renderSystem = new RenderSystem( config, backbuffer );
		
		engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
		engine.addSystem( new MotionControlSystem( config ), SystemPriorities.update );
		engine.addSystem( renderSystem, SystemPriorities.render );
		
		creator.createGamestate();
		
		System.notifyOnRender( renderSystem.setFramebuffer );

	}
	
	public function start():Void { //trace( "start" );
		
		tickProvider = new KhaFrameTickProvider( 10 );
		tickProvider.add( engine.update );
		tickProvider.start();
	}

}
