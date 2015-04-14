package ;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.util.FlxRandom;

//typedef Lane = { respawnTime:Float, position:FlxPoint }


class Lane
{
	public var respawnTime:Float;
	public var position:FlxPoint;
	
	public function new()
	{
		
	}
}

class EnemyHandler extends FlxGroup
{
	public var enemies:FlxTypedGroup<Enemy>;
	
	var leftLane:Lane;
	var rightLane:Lane;
	var midLane:Lane;
	
	var enemySize:Float = 100;
	
	var minRespawn:Float = 1.7;
	var maxRespawn:Float = 2.8;
	
	var lifespan:Float = 1;
	
	public function new() 
	{
		super();
		enemies = new FlxTypedGroup<Enemy>();
		enemies.maxSize = 6;
		add(enemies);
		createLanes();
	}
	
	override public function update():Void 
	{
		super.update();
		updateLanes();
		
		for (enemy in enemies)
		{
			if (!enemy.alive)
			{
				lifespan -= FlxG.elapsed;
				if (lifespan < 0)
				{
					enemies.remove(enemy);
				}
			}
			
			
		}
	}
	
	private function createLanes():Void
	{
		leftLane = new Lane();
		rightLane = new Lane();
		midLane = new Lane();
		
		leftLane.position = new FlxPoint(FlxG.width * 0.2 - enemySize / 2, -FlxG.height * 0.2);
		leftLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		
		midLane.position = new FlxPoint(FlxG.width / 2 - enemySize / 2, -FlxG.height * 0.2);
		midLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		
		rightLane.position = new FlxPoint(FlxG.width * 0.8 - enemySize / 2, -FlxG.height * 0.2);
		rightLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		
	}
	
	private function updateLanes():Void
	{
		leftLane.respawnTime -= FlxG.elapsed;
		rightLane.respawnTime -= FlxG.elapsed;
		midLane.respawnTime -= FlxG.elapsed;
		
		if (leftLane.respawnTime <= 0)
		{
			var enemy = new Enemy(leftLane.position);
			add(enemy.gibs);
			enemies.add(enemy);
			//enemies.add(new Enemy(leftLane.position));
			leftLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		}
		
		if (rightLane.respawnTime <= 0)
		{
			var enemy = new Enemy(rightLane.position);
			add(enemy.gibs);
			enemies.add(enemy);
			rightLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		}
		
		if (midLane.respawnTime <= 0)
		{
			var enemy = new Enemy(midLane.position);
			add(enemy.gibs);
			enemies.add(enemy);
			midLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		}
	}
	
	public function destroyedLeft():Void
	{
		leftLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		//leftLane.respawnTime = 0;
	}
	
	public function destroyedRight():Void
	{
		rightLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		//rightLane.respawnTime = 0;
	}
	
	public function destroyedMid():Void
	{
		midLane.respawnTime = FlxRandom.floatRanged(minRespawn, maxRespawn);
		//midLane.respawnTime = 0;
	}
}