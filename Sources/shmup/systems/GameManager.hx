package shmup.systems;
import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;
import shmup.nodes.GameNode;
import shmup.nodes.SpaceshipNode;

/**
 * ...
 * @author Urs Stutz
 */
class GameManager extends System {
	
	var creator:EntityCreator;
	var config:GameConfig;

	var gameNodes:NodeList<GameNode>;
	var spaceships:NodeList<SpaceshipNode>;
	
	public function new( creator:EntityCreator, config:GameConfig ) {
		
		super();
		this.creator = creator;
		this.config = config;
	}
	
	override public function addToEngine(engine:Engine):Void {
		
		gameNodes = engine.getNodeList( GameNode );
		spaceships = engine.getNodeList( SpaceshipNode );
	}
	
	override public function removeFromEngine(engine:Engine):Void {
		
		gameNodes = null;
		spaceships = null;
	}
	
	override public function update(time:Float):Void {
		
		for ( node in gameNodes ) {
			
			if ( spaceships.empty ) {
				
				creator.createSpaceship( config.width / 2, config.height * 0.8 );
			}
		}
	}
}