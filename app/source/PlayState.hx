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
	var redTower:Tower;
	var greenTower:Tower;
	var blueTower:Tower;
	
	var starfield:FlxStarField2D;
	
	override public function create():Void
	{
		super.create();
		
		
		starfield = new FlxStarField2D();
		starfield.setStarSpeed(1,2);
		add(starfield);
		
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
		
		
		
		//FlxG.sound.playMusic("assets/music/main_music.ogg");
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
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
					enemiesHandler.enemies.remove(enemy);
				}
				
				if (FlxG.overlap(shot, enemy) && shot.type != enemy.type)
				{
					enemiesHandler.enemies.remove(enemy);
					shots.remove(shot);
					
					if (enemy.type == "red")
					{
						enemiesHandler.destroyedLeft();
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
					enemiesHandler.enemies.clear();
					shots.clear();
					openSubState(new RetryState());
				}
			}
		}
		
		for (enemy in enemiesHandler.enemies)
		{
			if (FlxG.overlap(redTower, enemy) && redTower.type != enemy.type)
				{
					enemiesHandler.enemies.clear();
					shots.clear();
					openSubState(new RetryState());
				}
				
				if (FlxG.overlap(greenTower, enemy) && greenTower.type != enemy.type)
				{
					enemiesHandler.enemies.clear();
					shots.clear();
					openSubState(new RetryState());
				}
				
				if (FlxG.overlap(blueTower, enemy) && blueTower.type != enemy.type)
				{
					enemiesHandler.enemies.clear();
					shots.clear();
					openSubState(new RetryState());
				}
		}
	}
	
	
}