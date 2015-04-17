package ;
import flixel.FlxSubState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

/**
 * ...
 * @author w
 */
class RetryState extends FlxSubState
{
	var statusText:FlxText;
	var timeText:FlxText;
	
	var landedStatus:FlxText;
	var destroyedStatus:FlxText;
	
	var save:FlxSave;
	var time:Int;
	
	public function new(boarded:Bool,survivedTime:Int) 
	{
		super();
		
		time = survivedTime;
		save = new FlxSave();
		save.bind(Reg.SAVE_DATA);
		
		statusText = new FlxText();
		statusText.setFormat(Reg.gameFont, 25, FlxColor.WHITE, "center");
		if (boarded)
		{
			statusText.text = "you have been boarded";
		}else
			statusText.text = "friendly fire";
		
		statusText.setPosition(FlxG.width/2 - statusText.fieldWidth/2, FlxG.height * 0.2);
		add(statusText);
		
		timeText = new FlxText();
		timeText.setFormat(Reg.gameFont, 25, FlxColor.WHITE, "center");
		timeText.text = "You last for " + survivedTime+" seconds";
		timeText.setPosition(FlxG.width/2 - timeText.fieldWidth/2, FlxG.height * 0.3);
		add(timeText);
		
		landedStatus = new FlxText();
		landedStatus.setFormat(Reg.gameFont, 25, FlxColor.WHITE, "center");
		landedStatus.text = "Succesfully landed :\nRed : " + Statistics.redLanded + "\nGreen : " + Statistics.greenLanded + "\nBlue : " + Statistics.blueLanded;
		landedStatus.setPosition(FlxG.width/2 - landedStatus.fieldWidth/2, FlxG.height * 0.4);
		add(landedStatus);
		
		destroyedStatus = new FlxText();
		destroyedStatus.setFormat(Reg.gameFont, 25, FlxColor.WHITE, "center");
		destroyedStatus.text = "Ships destroyed : " + Statistics.shipsDestroyed+"\n\nTouch to retry";
		destroyedStatus.setPosition(FlxG.width / 2 - destroyedStatus.fieldWidth / 2, FlxG.height * 0.6);
		add(destroyedStatus);
		
		saveData();
		
		trace(save.data.bestTime,save.data.bestDestroy,save.data.bestRed,save.data.bestBlue,save.data.bestGreen);
		
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
	
	function saveData():Void
	{
		
		if (save.data.bestTime == null)
		{
			save.data.bestTime = 0;
		}else
		{
			if (save.data.bestTime < time)
			{
				save.data.bestTime = time;
			}
		}
		
		if (save.data.bestDestroy == null)
		{
			save.data.bestDestroy = 0;
		}else
		{
			if (save.data.bestDestroy < Statistics.shipsDestroyed)
			{
				save.data.bestDestroy = Statistics.shipsDestroyed;

			}
		}
		
		if (save.data.bestRed == null)
		{
			save.data.bestRed = 0;
		}else
		{
			if (save.data.bestRed < Statistics.redLanded)
			{
				save.data.bestRed = Statistics.redLanded;
			}
		}
		
		if (save.data.bestGreen == null)
		{
			save.data.bestGreen = 0;
		}else
		{
			if (save.data.bestGreen < Statistics.greenLanded)
			{
				save.data.bestGreen = Statistics.greenLanded;
			}
		}
		
		if (save.data.bestBlue == null)
		{
			save.data.bestBlue = 0;
		}else
		{
			if (save.data.bestBlue < Statistics.blueLanded)
			{
				save.data.bestBlue = Statistics.blueLanded;
			}
		}
		save.flush();
	}
	
}