package ;
import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.util.FlxColor;


class FirstScreen extends FlxState
{
	var starfield:FlxStarField2D;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		FlxG.sound.playMusic("assets/music/main_music.ogg");
		starfield = new FlxStarField2D();
		starfield.setStarSpeed(1, 20);
		starfield.setStarDepthColors(20,FlxColor.SILVER,FlxColor.GRAY);
		add(starfield);
	}
	
	override public function update():Void 
	{
		super.update();
		if (FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MenuState());
		}
	}
	
}