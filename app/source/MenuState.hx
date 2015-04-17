package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.addons.display.FlxStarField.FlxStarField2D;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var playButton:FlxText;
	var instructionButton:FlxText;
	
	var starfield:FlxStarField2D;
	
	override public function create():Void
	{
		super.create();
		
		starfield = new FlxStarField2D();
		starfield.setStarSpeed(1, 20);
		starfield.setStarDepthColors(20,FlxColor.SILVER,FlxColor.GRAY);
		add(starfield);
		
		playButton = new FlxText();
		playButton.setFormat(Reg.gameFont, 25, FlxColor.WHITE);
		
		#if android
		playButton.text = "PLAY";
		#end
		
		#if neko
		playButton.text = "Q for PLAY";
		#end
		playButton.setPosition(FlxG.width / 2 - playButton.fieldWidth / 2, FlxG.height * 0.3);
		add(playButton);
		
		instructionButton = new FlxText();
		instructionButton.setFormat(Reg.gameFont, 25, FlxColor.WHITE);
		
		#if android
		instructionButton.text = "INSTRUCTIONS";
		#end
		
		#if neko
		instructionButton.text = "W for INSTRUCTIONS";
		#end
		instructionButton.setPosition(FlxG.width / 2 - instructionButton.fieldWidth / 2, FlxG.height * 0.5);
		add(instructionButton);
		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		#if android
		for (touch in FlxG.touches.list)
		{
			if (touch.overlaps(playButton))
			{
				FlxG.switchState(new PlayState());
			}
			
			if (touch.overlaps(instructionButton))
			{
				FlxG.switchState(new InstructionState());
			}
		}
		#end
		
		#if neko
		if (FlxG.keys.justPressed.Q)
		{
			FlxG.switchState(new PlayState());
		}
		
		if (FlxG.keys.justPressed.W)
		{
			FlxG.switchState(new InstructionState());
		}
		#end
	}	
}