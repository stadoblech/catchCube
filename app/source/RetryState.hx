package ;
import flixel.FlxSubState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author w
 */
class RetryState extends FlxSubState
{
	var againText:FlxText;
	
	public function new() 
	{
		super();
		againText = new FlxText();
		againText.setFormat("assets/fonts/orbitron.otf", 25, FlxColor.WHITE,"center");
		againText.text = "TODO : you have been boarded\nor friendly fire";
		againText.setPosition(0,400);
		add(againText);
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