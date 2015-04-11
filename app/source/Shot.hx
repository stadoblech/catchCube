package ;
import flixel.FlxSprite;
import flixel.util.FlxColor;
/**
 * ...
 * @author w
 */
class Shot extends FlxSprite
{
	public var type:String;
	
	public function new(x:Float = 0,y:Float = 0,_type:String) 
	{
		super(x, y);
		type = _type;
		
		if (type == "red")
		{
			makeGraphic(10, 10,FlxColor.RED);
		}
		if (type == "green")
		{
			makeGraphic(10, 10,FlxColor.GREEN);
		}
		if (type == "blue")
		{
			makeGraphic(10, 10,FlxColor.BLUE);
		}
		
	}
	
	override public function update():Void 
	{
		super.update();
		y -= 5;
	}
	
}