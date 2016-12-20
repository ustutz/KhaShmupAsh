package shmup.components.types;

/**
 * ...
 * @author Urs Stutz
 */
class Score {

	public var scoreText:String;
	public var points:Int;
	
	public function new( scoreText:String, startPoints:Int = 0 ) {
		this.scoreText = scoreText;
		points = startPoints;
	}
	
}