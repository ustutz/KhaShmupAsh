package shmup.systems;
import ash.tools.ListIteratingSystem;
import shmup.EntityCreator;
import shmup.GameConfig;
import shmup.nodes.EnemySpawnerNode;

/**
 * ...
 * @author Urs Stutz
 */
class EnemySpawnerSystem extends ListIteratingSystem<EnemySpawnerNode> {
	
	var creator:EntityCreator;
	var config:GameConfig;

	public function new( creator:EntityCreator, config:GameConfig ) {
		
		super( EnemySpawnerNode, updateNode );
		this.creator = creator;
		this.config = config;
	}
	
	function updateNode( node:EnemySpawnerNode, time:Float ):Void { 
		
		var enemySpawner = node.enemySpawner;
		
		enemySpawner.currentTime += time;
		
		if ( enemySpawner.currentTime >= enemySpawner.spawnNextTime ) {
			
			enemySpawner.currentTime = 0;
			enemySpawner.spawnNextTime = generateRandomSpawnTime( enemySpawner.spawnMinTime, enemySpawner.spawnNextTime );
			var randomX = generateRandomX( enemySpawner.minSpawnX, enemySpawner.maxSpawnX - enemySpawner.enemyImage.width );
			creator.createEnemy( randomX, -enemySpawner.enemyImage.height, enemySpawner.enemyImage );
		}
	}
	
	function generateRandomSpawnTime( minTime:Float, maxTime:Float ):Float {
		return minTime + Math.random() * ( maxTime - minTime );
	}

	function generateRandomX( minSpawnX, maxSpawnX ):Int {
		return Std.random( maxSpawnX - minSpawnX ) + minSpawnX;
	}
}