package shmup.components.types;
import shmup.components.TGameState;

/**
 * ...
 * @author Urs Stutz
 */
class GameState {

	public var score:Int;
	public var state:TGameState;
	
	public function new( state:TGameState, score:Int = 0 ) {
		this.state = state;
		this.score = score;
	}
	
}