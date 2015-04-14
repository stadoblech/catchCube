package ;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxEmitterExt;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
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
	
	public var speed:Float = 0;
	
	public var gibs:FlxEmitterExt;
	
	var lifeSpan:Float = 1;
	
	public function new(startPos:FlxPoint) 
	{
		super(startPos.x,startPos.y);
		
		
		var enemyType = FlxRandom.intRanged(0, 2);
		speed = FlxRandom.floatRanged(4, 5);
		
		createGibs();
		
		switch(enemyType)
		{
			case 0:
				type = "red";
				loadGraphic("assets/images/ships/red.png");
			case 1:
				type = "green";
				loadGraphic("assets/images/ships/green.png");
			case 2:
				type = "blue";
				loadGraphic("assets/images/ships/blue.png");
			case 3:
				type = "neutral";
				makeGraphic(100, 100, FlxColor.GRAY);
		}
	}
	
	override public function update():Void 
	{
		super.update();
		y += speed;
	}
	
	override public function kill():Void 
	{
		super.kill();
		gibs.at(this);
		gibs.start(true, 1, 0, 0);
	}
	
	function createGibs():Void
	{
		gibs = new FlxEmitterExt();
		gibs.setXSpeed( -FlxRandom.intRanged(10,100), FlxRandom.intRanged(10,100));
		gibs.setYSpeed( -FlxRandom.intRanged(10,100), FlxRandom.intRanged(10,100));
		gibs.setRotation( -FlxRandom.intRanged(180,720), -FlxRandom.intRanged(180,720));
		gibs.gravity = 0;
		gibs.bounce = 1;
		gibs.makeParticles("assets/images/ships/gibs.png", 35, 16, false, 0);
	}
}