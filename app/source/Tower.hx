package ;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxPoint;
/**
 * ...
 * @author w
 */
class Tower extends FlxSprite
{

	var shots:FlxTypedGroup<Shot>;
	public var type:String;
	
	public function new(sh:FlxTypedGroup<Shot>) 
	{
		super();
		shots = sh;
	}
	
	override public function update():Void 
	{
		super.update();
		
		#if android
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(this))
				{	
					if (type == "red")
					{
						var shot = new Shot(type);
						shot.setPosition(x + width /2 - shot.width/2, y);
						shots.add(shot);
					}
					if (type == "blue")
					{
						var shot = new Shot(type);
						shot.setPosition(x + width / 2 - shot.width/2, y);
						shots.add(shot);
					}
					if (type == "green")
					{
						var shot = new Shot(type);
						shot.setPosition(x + width / 2 - shot.width/2, y);
						shots.add(shot);
					}
					
				}
			}
		}
		#end
		
		#if neko
		
		if (FlxG.keys.justPressed.A && type == "red")
		{
			var shot = new Shot(type);
			shot.setPosition(x + width/2 - shot.width/2,y);
			shots.add(shot);
		}
		if (FlxG.keys.justPressed.S && type == "green")
		{
			var shot = new Shot(type);
			shot.setPosition(x + width/2 - shot.width,y);
			shots.add(shot);
		}
		if (FlxG.keys.justPressed.D && type == "blue")
		{
			var shot = new Shot(type);
			shot.setPosition(x + width/2 - shot.width,y);
			shots.add(shot);
		}
		#end
	}	
}