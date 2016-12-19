package shmup.components.types;
import ash.fsm.EntityStateMachine;

/**
 * ...
 * @author Urs Stutz
 */
class Enemy {
	
	public var esm:EntityStateMachine;

	public function new( esm:EntityStateMachine = null ) {
		this.esm = esm;
	}
	
}