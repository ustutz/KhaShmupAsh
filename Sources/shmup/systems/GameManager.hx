package shmup.systems;
import ash.core.Engine;
import ash.core.NodeList;
import ash.core.System;
import shmup.components.TGameState;
import shmup.nodes.GameNode;
import shmup.nodes.KeyInputNode;
import shmup.nodes.ScoreNode;
import shmup.nodes.SpaceshipNode;
import shmup.nodes.TextNode;

/**
 * ...
 * @author Urs Stutz
 */
class GameManager extends System {
	
	var engine:Engine;
	var creator:EntityCreator;
	var config:GameConfig;

	var gameNodes:NodeList<GameNode>;
	var spaceships:NodeList<SpaceshipNode>;
	var textNodes:NodeList<TextNode>;
	var keyInputs:NodeList<KeyInputNode>;
	var scores:NodeList<ScoreNode>;
	
	public function new( engine:Engine, creator:EntityCreator, config:GameConfig ) {
		
		super();
		this.engine = engine;
		this.creator = creator;
		this.config = config;
	}
	
	override public function addToEngine(engine:Engine):Void {
		
		gameNodes = engine.getNodeList( GameNode );
		keyInputs = engine.getNodeList( KeyInputNode );
		textNodes = engine.getNodeList( TextNode );
		scores = engine.getNodeList( ScoreNode );
		spaceships = engine.getNodeList( SpaceshipNode );
	}
	
	override public function removeFromEngine(engine:Engine):Void {
		
		gameNodes = null;
		keyInputs = null;
		textNodes = null;
		spaceships = null;
	}
	
	public function setState( state:TGameState ):Void {
		for ( node in gameNodes ) {
			node.state.state = state;
		}
	}
	
	public function activateMainMenu():Void {
		
		creator.createTitle();
		setState( TGameState.MainMenu );
	}
	
	public function deactivateMainMenu():Void {
		
		for ( node in textNodes ) {
			creator.destroyEntity( node.entity );
		}
		engine.addSystem( new EnemySpawnerSystem( creator, config ), SystemPriorities.update );
	}
	
	public function activatePlaying():Void {
		
		creator.createSpaceship( config.width / 2, config.height * 0.8 );
		creator.createScore();
		setState( TGameState.Playing );
	}
	
	public function deactivatePlaying():Void {
		
	}
	
	public function activateGameOver():Void {
		
		creator.createGameOver();
		setState( TGameState.Over );

	}
	
	public function deactivateGameOver():Void {
		
		for ( node in textNodes ) {
			creator.destroyEntity( node.entity );
		}
		
		for ( scoreNode in scores ) {
			scoreNode.score.points = 0;
		}
	}
	
	override public function update(time:Float):Void {
		
		for ( gameNode in gameNodes ) {
			
			// in MainMenu or GameOver screen
			for ( keyInputNode in keyInputs ) {
				
				var keyStates = keyInputNode.keyStates;
				
				if ( keyStates.shoot ) {
					
					if ( gameNode.state.state == TGameState.MainMenu ) {
						deactivateMainMenu();
						activatePlaying();
						return;
					}
					
					if ( gameNode.state.state == TGameState.Over ) {
						deactivateGameOver();
						activatePlaying();
						return;
					}
				}
			}
			
			if ( gameNode.state.state == TGameState.Playing ) {
				
				if ( spaceships.empty ) {
					deactivatePlaying();
					activateGameOver();
				}
			}
		}
	}
}