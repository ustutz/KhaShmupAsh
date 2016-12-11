package shmup.systems;
import ash.core.NodeList;
import ash.core.System;
import kha.Framebuffer;
import kha.Image;
import shmup.nodes.RenderNode;


/**
 * ...
 * @author Urs Stutz
 */
class RenderSystem extends System {

	var nodes:NodeList<RenderNode>;
	
	var backbuffer:Image;
	var framebuffer:Framebuffer;
	
	public function new( backbuffer:Image ) {
		
		super();
		this.backbuffer = backbuffer;
		
	}
	
	public inline function setFramebuffer( framebuffer:Framebuffer ) {
		this.framebuffer = framebuffer;
	}
	
	override public function update( time:Float ):Void {
		
		if ( framebuffer == null ) {
			return;
		}
		
		var g = backbuffer.g2;
		
		for (node in nodes) {
			
		}
	}
	
}