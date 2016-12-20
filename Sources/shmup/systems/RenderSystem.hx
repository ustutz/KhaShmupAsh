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
import shmup.nodes.TextNode;


/**
 * ...
 * @author Urs Stutz
 */
class RenderSystem extends System {

	var renderNodes:NodeList<RenderNode>;
	var textNodes:NodeList<TextNode>;
	
	var config:GameConfig;
	var backbuffer:Image;
	var framebuffer:Framebuffer;
	
	public function new( config:GameConfig, backbuffer:Image ) {
		
		super();
		this.config = config;
		this.backbuffer = backbuffer;
	}
	
	override public function addToEngine( engine:Engine ):Void {
		
		renderNodes = engine.getNodeList( RenderNode );
		textNodes = engine.getNodeList( TextNode );
	}
	
	override public function removeFromEngine( engine:Engine ):Void {
		
		renderNodes = null;
		textNodes = null;
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
		
		for (node in renderNodes) {
			
			var display = node.display;
			var position = node.position;
			
			g.drawImage( display.image, Std.int( position.x ), Std.int( position.y ));
		}
		
		for ( node in textNodes ) {
			
			var textFont = node.textFont;
			var position = node.position;
			var textContent = node.textContent;
			
			g.font = textFont.font;
			g.fontSize = textFont.fontSize;
			g.drawString( textContent.text, position.x, position.y );
		}
		
		g.end();
		
		framebuffer.g2.begin();
		Scaler.scale( backbuffer, framebuffer, kha.System.screenRotation );
		framebuffer.g2.end();
	}
	
}