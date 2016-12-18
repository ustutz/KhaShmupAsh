package shmup;
import kha.Key;
import shmup.components.KeyStates;

/**
 * ...
 * @author Urs Stutz
 */
class KeyListener {
	
	var keyStates:KeyStates;

	public function new( keyStates:KeyStates ) {
		this.keyStates = keyStates;
	}
	
	public function keyDown( key:Key, value: String ) { 
		
		switch (key) {
			case LEFT:
				keyStates.left = true;
			case RIGHT:
				keyStates.right = true;
			case UP:
				keyStates.up = true;
			case DOWN:
				keyStates.down = true;
			case CHAR:
				if (value == "z") {
					keyStates.shoot = true;
				}
			default:
				// no-op
		}
	}

	public function keyUp( key: Key, value: String ) { 
		
		switch (key) {
			case LEFT:
				keyStates.left = false;
			case RIGHT:
				keyStates.right = false;
			case UP:
				keyStates.up = false;
			case DOWN:
				keyStates.down = false;
			case CHAR:
				if (value == "z") {
					keyStates.shoot = false;
				}
			default:
				//no-op
		}
	}
}