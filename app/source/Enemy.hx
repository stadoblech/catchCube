package ;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxColor;

/**
 * ...
 * @author w
 */
class Enemy extends FlxSprite
{
	public var type:String;
	
	public function new(startPos:FlxPoint) 
	{
		super(startPos.x,startPos.y);
		
		var enemyType = FlxRandom.intRanged(0, 2);
		
		switch(enemyType)
		{
			case 0:
				type = "red";
				makeGraphic(100, 100, FlxColor.RED);
				//loadGraphic("assets/images/ships/test.png");
				angle += 180;
			case 1:
				type = "green";
				makeGraphic(100, 100, FlxColor.GREEN);
			case 2:
				type = "blue";
				makeGraphic(100, 100, FlxColor.BLUE);
			case 3:
				type = "neutral";
				makeGraphic(100, 100, FlxColor.GRAY);
		}
	}
	
	override public function update():Void 
	{
		super.update();
		y += 5;
	}
}