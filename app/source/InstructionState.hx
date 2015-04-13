package ;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author w
 */
class InstructionState extends FlxState
{
	var instructionText:FlxText;
	
	public function new() 
	{
		super();
	}
	
	
	override public function create():Void 
	{
		super.create();
		FlxG.sound.playMusic("assets/music/main_music.ogg");
		
		instructionText = new FlxText();
		instructionText.setFormat("assets/fonts/orbitron.otf", 25, FlxColor.WHITE, "center");
		instructionText.text = "Instructions :\ntouch towers to shoot\nshoot not matching color ships\ncarefull for friendly fire\ndont let wrong ship dock";
		instructionText.setPosition(0,400);
		add(instructionText);
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (FlxG.mouse.justPressed)
		{
			FlxG.switchState(new PlayState());
		}
	}
}