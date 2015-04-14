package ;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
/**
 * ...
 * @author w
 */
class GreenTower extends Tower
{

	public function new(shots:FlxTypedGroup<Shot>) 
	{
		super(shots);
		//makeGraphic(100,100,FlxColor.GREEN);
		loadGraphic("assets/images/docks/green_top.png");
		setPosition(FlxG.width / 2 - this.width / 2, FlxG.height-height);
		type = "green";
	}
	
}