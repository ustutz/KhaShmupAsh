package shmup;

import ash.core.Engine;
import ashKha.tick.KhaFrameTickProvider;
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
	
	public function new( screenWidth:Int, screenHeight:Int ) {
		
		this.screenHeight = screenHeight;
		this.screenWidth = screenWidth;
	}
	
	public function init():Void {
		
		engine = new Engine();
		creator = new EntityCreator( engine );
		config = new GameConfig( screenWidth, screenHeight );
		
		// create a buffer to draw to
		var backbuffer = Image.createRenderTarget( screenWidth, screenHeight );
		var renderSystem = new RenderSystem( backbuffer );
		
		engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
		engine.addSystem( renderSystem, SystemPriorities.render );
		
		System.notifyOnRender( renderSystem.setFramebuffer );
	}
	
	public function start():Void {
		
		tickProvider = new KhaFrameTickProvider();
		tickProvider.add( engine.update );
		tickProvider.start();
	}
}
