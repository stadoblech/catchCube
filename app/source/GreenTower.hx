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
		makeGraphic(100,100,FlxColor.GREEN);
		setPosition(FlxG.width / 2 - this.width / 2, FlxG.height * 0.8);	
		
		type = "green";
	}
	
}