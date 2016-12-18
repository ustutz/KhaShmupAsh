package shmup.components.types;
import kha.FastFloat;
import kha.Image;

/**
 * ...
 * @author Urs Stutz
 */
class EnemySpawner {
	
	public var enemyImage:Image;
	public var spawnMinTime:FastFloat;
	public var spawnMaxTime:FastFloat;
	public var minSpawnX:Int;
	public var maxSpawnX:Int;
	public var maxPositionY:Int;
	
	public var currentTime:FastFloat;
	public var spawnNextTime:FastFloat;

	public function new( enemyImage:Image, spawnMinTime:FastFloat, spawnMaxTime:FastFloat, ?minSpawnX:Int = 0, maxSpawnX:Int = 0, maxPositionY:Int = 600 ) {
		
		this.enemyImage = enemyImage;
		this.spawnMinTime = spawnMinTime;
		this.spawnMaxTime = spawnMaxTime;
		this.minSpawnX = minSpawnX;
		this.maxSpawnX = maxSpawnX;
		this.maxPositionY = maxPositionY;
		
		currentTime = 0;
		spawnNextTime = spawnMaxTime;
	}
	
}