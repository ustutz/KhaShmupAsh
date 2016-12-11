package shmup.systems;
import ash.core.System;

/**
 * ...
 * @author Urs Stutz
 */
class GameManager extends System {
	
	var creator:EntityCreator;
	var config:GameConfig;

	public function new( creator:EntityCreator, config:GameConfig ) {
		
		super();
		this.creator = creator;
		this.config = config;
	}
	
}