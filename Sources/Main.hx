package;

import kha.System;
import shmup.KhaShmup;

class Main {
	
	public static function main() {
		
		static inline var SCREEN_HEIGHT = 800;
		static inline var SCREEN_HEIGHT = 600;
		
		System.init( {title: "Kha Ash Shmup", width: SCREEN_WIDTH, height: SCREEN_HEIGHT}, init );
	}
	
	static function init():Void {
		
		var khaShmup = new KhaShmup( SCREEN_WIDTH, SCREEN_HEIGHT );
		khaShmup.init();
		khaShmup.start();
	}
}
