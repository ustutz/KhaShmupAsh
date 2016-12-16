package shmup;

import ash.core.Engine;
import ashKha.tick.KhaFrameTickProvider;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.Scheduler;
import kha.System;
import shmup.EntityCreator;
import shmup.GameConfig;
import shmup.systems.GameManager;
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

	public function new( screenWidth:Int, screenHeight:Int ) {
		
		this.screenHeight = screenHeight;
		this.screenWidth = screenWidth;
	}
	
	public function init():Void {
		
		engine = new Engine();
		creator = new EntityCreator( engine );
		config = new GameConfig( screenWidth, screenHeight, Color.fromValue( 0x26004d ));
		
		// create a buffer to draw to
		var backbuffer = Image.createRenderTarget( screenWidth, screenHeight );
		var renderSystem = new RenderSystem( config, backbuffer );
		
		engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
		engine.addSystem( renderSystem, SystemPriorities.render );
		
		creator.createGamestate();
		
		System.notifyOnRender( renderSystem.setFramebuffer );

	}
	
	public function start():Void { //trace( "start" );
		
		tickProvider = new KhaFrameTickProvider();
		tickProvider.add( engine.update );
		tickProvider.start();
	}

}
