package;

import kha.Assets;
import kha.System;
import shmup.KhaShmup;

class Main {
	
	static inline var SCREEN_WIDTH = 800;
	static inline var SCREEN_HEIGHT = 600;
	
	public static function main() { //trace( "main" );
		
		System.init( {title: "Kha Shmup with Ash", width: SCREEN_WIDTH, height: SCREEN_HEIGHT}, loadAssets );
	}

	static function loadAssets():Void { //trace( "Main.init" );
		
		Assets.loadEverything( loadingFinished );
	}
	
	static function loadingFinished() {
		
		var khaShmup = new KhaShmup( SCREEN_WIDTH, SCREEN_HEIGHT );
		khaShmup.init();
		khaShmup.start();
	}
}
