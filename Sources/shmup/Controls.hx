package shmup;
import kha.Key;
import shmup.components.KeyControls;

/**
 * ...
 * @author Urs Stutz
 */
class Controls {
	
	var keyControls:KeyControls;

	public function new( keyControls:KeyControls ) {
		this.keyControls = keyControls;
	}
	
	public function keyDown( key:Key, value: String ) { 
		
		switch (key) {
			case LEFT:
				keyControls.left = true;
			case RIGHT:
				keyControls.right = true;
			case UP:
				keyControls.up = true;
			case DOWN:
				keyControls.down = true;
			default:
				// no-op
		}
	}

	public function keyUp( key: Key, value: String ) { 
		
		switch (key) {
			case LEFT:
				keyControls.left = false;
			case RIGHT:
				keyControls.right = false;
			case UP:
				keyControls.up = false;
			case DOWN:
				keyControls.down = false;
			default:
				//no-op
		}
	}
}