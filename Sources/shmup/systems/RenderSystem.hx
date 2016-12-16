package shmup.systems;
import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;
import kha.Framebuffer;
import kha.Image;
import kha.Scaler;
import shmup.GameConfig;
import shmup.components.Position;
import shmup.nodes.RenderNode;


/**
 * ...
 * @author Urs Stutz
 */
class RenderSystem extends System {

	var nodes:NodeList<RenderNode>;
	
	var config:GameConfig;
	var backbuffer:Image;
	var framebuffer:Framebuffer;
	
	public function new( config:GameConfig, backbuffer:Image ) {
		
		super();
		this.config = config;
		this.backbuffer = backbuffer;
	}
	
	override public function addToEngine( engine:Engine ):Void {
		
		nodes = engine.getNodeList( RenderNode );
	}
	
	public function setFramebuffer( framebuffer:Framebuffer ) {
		this.framebuffer = framebuffer;
	}
	
	override public function update( time:Float ):Void {
		
		if ( framebuffer == null ) {
			return;
		}
		
		var g = backbuffer.g2;
		
		g.begin( config.bgColor );
		
		for (node in nodes) {
			
			var display = node.display;
			var position = node.position;
			
			g.drawImage( display.image, position.translation.x, position.translation.y );
		}
		
		g.end();
		
		framebuffer.g2.begin();
		Scaler.scale( backbuffer, framebuffer, kha.System.screenRotation );
		framebuffer.g2.end();
	}
	
}