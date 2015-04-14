package ;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
/**
 * ...
 * @author w
 */
class BlueTower extends Tower
{

	public function new(shots:FlxTypedGroup<Shot>) 
	{
		super(shots);
		//makeGraphic(100,100,FlxColor.BLUE);
		loadGraphic("assets/images/docks/blue.png");
		setPosition(FlxG.width * 0.8 - this.width / 2, FlxG.height-height);	
		
		type = "blue";
	}
	
}