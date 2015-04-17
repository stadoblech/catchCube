package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.addons.display.FlxStarField.FlxStarField2D;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var shots:FlxTypedGroup<Shot>;
	
	var enemiesHandler:EnemyHandler;
	
	var redTowerBot:FlxSprite;
	var greenTowerBot:FlxSprite;
	var blueTowerBot:FlxSprite;
	
	var redTower:Tower;
	var greenTower:Tower;
	var blueTower:Tower;
	
	var starfield:FlxStarField2D;
	
	var timer:Float = 0;
	
	override public function create():Void
	{
		super.create();
		
		
		starfield = new FlxStarField2D();
		starfield.setStarSpeed(1, 2);
		add(starfield);
		
		redTowerBot = new FlxSprite();
		redTowerBot.loadGraphic("assets/images/docks/bot_animated.png", true);
		redTowerBot.animation.add("dock", [0, 1, 2, 3, 4], 5, true);
		redTowerBot.animation.play("dock");
		redTowerBot.setPosition(FlxG.width * 0.2 - redTowerBot.width / 2, FlxG.height - redTowerBot.height);
		add(redTowerBot);
		
		
		greenTowerBot = new FlxSprite();	
		greenTowerBot.loadGraphic("assets/images/docks/bot_animated.png", true);
		greenTowerBot.animation.add("dock", [0, 1, 2, 3, 4], 5, true);
		greenTowerBot.animation.play("dock");
		greenTowerBot.setPosition(FlxG.width / 2 - greenTowerBot.width / 2, FlxG.height-greenTowerBot.height);
		add(greenTowerBot);
		
		blueTowerBot = new FlxSprite();
		blueTowerBot.loadGraphic("assets/images/docks/bot_animated.png", true);
		blueTowerBot.animation.add("dock", [0, 1, 2, 3, 4], 5, true);
		blueTowerBot.animation.play("dock");
		blueTowerBot.setPosition(FlxG.width * 0.8 - blueTowerBot.width / 2, FlxG.height - blueTowerBot.height);
		add(blueTowerBot);
		
		enemiesHandler = new EnemyHandler();
		add(enemiesHandler);
		
		shots = new FlxTypedGroup<Shot>();
		add(shots);
		
		redTower = new RedTower(shots);
		add(redTower);
		
		greenTower = new GreenTower(shots);
		add(greenTower);
		
		blueTower = new BlueTower(shots);
		add(blueTower);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		timer += FlxG.elapsed;
		for (shot in shots)
		{
			if (shot.y <= 0)
			{
				shots.remove(shot);
			}
			
			for (enemy in enemiesHandler.enemies)
			{
				if(enemy.y > FlxG.height)
				{
					if (enemy.type == "red")
					{
						enemiesHandler.destroyedLeft();
						Statistics.redLanded++;
					}
					if (enemy.type == "green")
					{
						enemiesHandler.destroyedMid();
						Statistics.greenLanded++;
					}
					if (enemy.type == "blue")
					{
						enemiesHandler.destroyedRight();
						Statistics.blueLanded++;
					}
					
					enemiesHandler.enemies.remove(enemy);
				}
				
				if (FlxG.overlap(shot, enemy) && shot.type != enemy.type)
				{
					enemy.kill();
					shots.remove(shot);
					
					if (enemy.type == "red")
					{
						enemiesHandler.destroyedLeft();
						Statistics.shipsDestroyed++;
					}
					
					if (enemy.type == "green")
					{
						enemiesHandler.destroyedMid();
					}
					
					if (enemy.type == "blue")
					{
						enemiesHandler.destroyedRight();
					}
				}
				if (FlxG.overlap(shot, enemy) && shot.type == enemy.type)
				{
					openSubState(new RetryState(false, Std.int(timer)));
					restartGame();
				}
			}
		}
		
		for (enemy in enemiesHandler.enemies)
		{
			if (FlxG.overlap(redTower, enemy) && redTower.type != enemy.type)
				{
					openSubState(new RetryState(true, Std.int(timer)));
					restartGame();
				}
				
				if (FlxG.overlap(greenTower, enemy) && greenTower.type != enemy.type)
				{
					openSubState(new RetryState(true, Std.int(timer)));
					restartGame();
				}
				
				if (FlxG.overlap(blueTower, enemy) && blueTower.type != enemy.type)
				{
					openSubState(new RetryState(true, Std.int(timer)));
					restartGame();
				}
		}
	}
	
	function restartGame():Void
	{
		enemiesHandler.enemies.clear();
		shots.clear();
		timer = 0;
		Statistics.redLanded = 0;
		Statistics.blueLanded = 0;
		Statistics.greenLanded = 0;
		Statistics.shipsDestroyed = 0;
	}
	
	
}