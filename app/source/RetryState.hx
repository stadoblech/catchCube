package ;
import flixel.FlxSubState;
import flixel.FlxG;
/**
 * ...
 * @author w
 */
class RetryState extends FlxSubState
{

	public function new() 
	{
		super();
	}
	
	override public function update():Void 
	{
		super.update();
		#if neko
		if (FlxG.keys.pressed.ANY)
		{
			close();
		}
		#end
		
		#if android
		if (FlxG.mouse.justPressed)
		{
			close();
		}
		#end
	}
	
}