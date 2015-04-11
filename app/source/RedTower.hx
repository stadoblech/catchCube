package ;
import flixel.group.FlxTypedGroup;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author w
 */
class RedTower extends Tower
{

	public function new(shots:FlxTypedGroup<Shot>) 
	{
		super(shots);
		makeGraphic(100,100,FlxColor.RED);
		setPosition(FlxG.width * 0.2 - this.width / 2, FlxG.height * 0.8);	
		
		type = "red";
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
	
	
}