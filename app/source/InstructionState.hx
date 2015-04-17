package ;
import flixel.addons.display.FlxStarField.FlxStarField2D;
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
	var starfield:FlxStarField2D;
	public function new() 
	{
		super();
	}
	
	
	override public function create():Void 
	{
		super.create();
		
		starfield = new FlxStarField2D();
		starfield.setStarSpeed(1, 20);
		starfield.setStarDepthColors(20, FlxColor.SILVER, FlxColor.GRAY);
		add(starfield);
		
		instructionText = new FlxText();
		instructionText.setFormat(Reg.gameFont, 20, FlxColor.WHITE, "center");
		instructionText.text = "Instructions :\n\ntouch towers to shoot\n\nshoot not matching color ships\n\ncarefull for friendly fire\n\ndont let wrong ship dock";
		instructionText.setPosition(FlxG.width/2 - instructionText.fieldWidth/2, FlxG.height * 0.4);
		add(instructionText);
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