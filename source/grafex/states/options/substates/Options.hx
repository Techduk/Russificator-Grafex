package grafex.states.options.substates;

import grafex.systems.song.Song;
import grafex.states.substates.LoadingState;
import grafex.systems.Paths;
import utils.FPSMem;
import lime.app.Application;
import lime.system.DisplayMode;
import flixel.util.FlxColor;
import Controls.KeyboardScheme;
import flixel.FlxG;
import openfl.display.FPS;
import flixel.graphics.FlxGraphic;
import openfl.Lib;
import flixel.FlxSubState;

class Option
{
	public function new()
	{
		display = updateDisplay();
	}

	private var description:String = "";
	private var display:String;
	private var acceptValues:Bool = false;

	public var acceptType:Bool = false;

	public var waitingType:Bool = false;

	public final function getDisplay():String
	{
		return display;
	}

	public final function getAccept():Bool
	{
		return acceptValues;
	}

	public final function getDescription():String
	{
		return description;
	}

	public function getValue():String
	{
		return updateDisplay();
	};

	public function onType(text:String)
	{
	}

	// Returns whether the label is to be updated.
	public function press():Bool
	{
		return true;
	}

	private function updateDisplay():String
	{
		return "";
	}

	public function left():Bool
	{
		return false;
	}

	public function right():Bool
	{
		return false;
	}
}

class DFJKOption extends Option
{
	var notPause:String = "";
	var somElse:String = "";

	public override function new()
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
				somElse = "Edit your keybindings";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
				somElse = "Измени своё управление";
		}

		super();
                if (OptionsMenu.isInPause)
			description = notPause;
		else
		description = somElse;
	}

	public override function press():Bool
	{
		//OptionsMenu.instance.selectedCatIndex = 4;
		//OptionsMenu.instance.switchCat(OptionsMenu.instance.options[4], false);

                if (OptionsMenu.isInPause)
			return false;
		OptionsMenu.openControllsState();
             		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Edit Keybindings";
		
			case "Russian":
				edite = "Изменить управление";
		}
		return edite;
	}
}

class NotesOption extends Option
{
	var notPause:String = "";
	var somElse:String = "";

	public override function new()
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
				somElse = "Edit notes colors";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
				somElse = "Измени цвет нот";
		}

		super();
                if (OptionsMenu.isInPause)
			description = notPause;
		else
		description = somElse;
	}

	public override function press():Bool
	{
		//OptionsMenu.instance.selectedCatIndex = 4;
		//OptionsMenu.instance.switchCat(OptionsMenu.instance.options[4], false);

                if (OptionsMenu.isInPause)
			return false;
		OptionsMenu.openNotesState();
             		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Edit Notes Colors";
		
			case "Russian":
				edite = "Изменить цвет нот";
		}
		return edite;
	}
}

class Customizeption extends Option
{
	var notPause:String = "";
	var somElse:String = "";

	public override function new()
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
				somElse = "Edit elements positions / beat offset";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
				somElse = "Изменение положения элементов / смещение ударов";
		}

		super();
                 if (OptionsMenu.isInPause)
			description = notPause;
		else
		description = somElse;
	}

	public override function press():Bool
	{
		//OptionsMenu.instance.selectedCatIndex = 4;
		//OptionsMenu.instance.switchCat(OptionsMenu.instance.options[4], false);


         if (OptionsMenu.isInPause)
			return false;
		OptionsMenu.openAjustState();
	          		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Edit elements positions and beat offset";
		
			case "Russian":
				edite = "Редактирование положения элементов и смещения ритма";
		}
		return edite;
	}
}

class SickMSOption extends Option
{
	var rlol:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				rlol =  " (Press R to reset)";
			
			case "Russian":
				rlol = " (Нажми R чтоб вернуть как было)";
		}

		super();
		description = desc + rlol;
		acceptType = true;
	}

	public override function left():Bool
	{
		ClientPrefs.sickWindow--;
		if (ClientPrefs.sickWindow < 0)
			ClientPrefs.sickWindow = 0;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.sickWindow++;
		display = updateDisplay();
		return true;
	}

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.sickWindow = 45;
	}

	private override function updateDisplay():String
	{
		return "SICK: < " + ClientPrefs.sickWindow + " ms >";
	}
}

class GoodMsOption extends Option
{
	var rlol:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				rlol =  " (Press R to reset)";
			
			case "Russian":
				rlol = " (Нажми R чтоб вернуть как было)";
		}

		super();
		description = desc + rlol;
		acceptType = true;
	}

	public override function left():Bool
	{
		ClientPrefs.goodWindow--;
		if (ClientPrefs.goodWindow < 0)
			ClientPrefs.goodWindow = 0;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.goodWindow++;
		display = updateDisplay();
		return true;
	}

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.goodWindow = 90;
	}

	private override function updateDisplay():String
	{
		return "GOOD: < " + ClientPrefs.goodWindow + " ms >";
	}
}

class BadMsOption extends Option
{
	var rlol:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				rlol =  " (Press R to reset)";
			
			case "Russian":
				rlol = " (Нажми R чтоб вернуть как было)";
		}

		super();
		description = desc + rlol;
		acceptType = true;
	}

	public override function left():Bool
	{
		ClientPrefs.badWindow--;
		if (ClientPrefs.badWindow < 0)
			ClientPrefs.badWindow = 0;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.badWindow++;
		display = updateDisplay();
		return true;
	}

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.badWindow = 135;
	}

	private override function updateDisplay():String
	{
		return "BAD: < " + ClientPrefs.badWindow + " ms >";
	}
}

/*class ShitMsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left():Bool
	{
		FlxG.save.data.shitMs--;
		if (FlxG.save.data.shitMs < 0)
			FlxG.save.data.shitMs = 0;
		display = updateDisplay();
		return true;
	}

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			FlxG.save.data.shitMs = 160;
	}

	public override function right():Bool
	{
		FlxG.save.data.shitMs++;
		display = updateDisplay();
		return true;
	}

	private override function updateDisplay():String
	{
		return "SHIT: < " + FlxG.save.data.shitMs + " ms >";
	}
}*/

class DownscrollOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.downScroll = !ClientPrefs.downScroll;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Downscroll: < " + (ClientPrefs.downScroll ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Нижний скролл (Downscroll): < " + (ClientPrefs.downScroll ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class GhostTapOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.ghostTapping = !ClientPrefs.ghostTapping;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "GhostTapping: < " + (ClientPrefs.ghostTapping ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Призрачные нажатия: < " + (ClientPrefs.ghostTapping ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class SkipTitleOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.skipTitleState = !ClientPrefs.skipTitleState;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "TitleState Skipping: < " + (ClientPrefs.skipTitleState ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "TitleState Пропуск: < " + (ClientPrefs.skipTitleState ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class KESustainsOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
                if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.keSustains = !ClientPrefs.keSustains;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Kade Engine Sustains System: < " + (ClientPrefs.keSustains ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Kade Engine Sustains Система: < " + (ClientPrefs.keSustains ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}



class ScoreZoom extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.scoreZoom = !ClientPrefs.scoreZoom;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Score zomming in beats: < " + (ClientPrefs.scoreZoom ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Оценка, увеличивающаяся в ударах: < " + (ClientPrefs.scoreZoom ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class HideHud extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
              	if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.hideHud = !ClientPrefs.hideHud;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "HUD: < " + (!ClientPrefs.hideHud ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Дисплей: < " + (!ClientPrefs.hideHud ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class MicedUpSusOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
              	if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.micedUpSus = !ClientPrefs.micedUpSus;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "MicedUp Sustains Filter: < " + (ClientPrefs.micedUpSus ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "MicedUp Sustains Фильтр: < " + (ClientPrefs.micedUpSus ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class ShowCombo extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.showCombo = !ClientPrefs.showCombo;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Combo Sprite: < " + (ClientPrefs.showCombo ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Комбо спрайт: < " + (ClientPrefs.showCombo ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class BlurNotes extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
           	if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.blurNotes = !ClientPrefs.blurNotes;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Blured Notes: < " + (ClientPrefs.blurNotes ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Размытие нот: < " + (ClientPrefs.blurNotes ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class AutoSave extends Option
{
	public function new(desc:String)
	{
		super();

			description = desc;
	}

	public override function left():Bool
	{

		ClientPrefs.chartautosave = !ClientPrefs.chartautosave;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Chart AutoSave: < " + (ClientPrefs.chartautosave ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Чарт АвтоСейф: < " + (ClientPrefs.chartautosave ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class AutoSaveInt extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.chartautosaveInterval--;
		if (ClientPrefs.chartautosaveInterval < 1)
		ClientPrefs.chartautosaveInterval = 1;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.chartautosaveInterval++;
		if (ClientPrefs.chartautosaveInterval > 15)
			ClientPrefs.chartautosaveInterval = 15;
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Chart AutoSave Interval: < " + ClientPrefs.chartautosaveInterval + " Minutes >";
		
			case "Russian":
				edite = "Чарт АвтоСейф интервал: < " + ClientPrefs.chartautosaveInterval + " Минут/а/ы >";
		}
		return edite;
	}
}


class NoReset extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.noReset = !ClientPrefs.noReset;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Reset Button: < " + (!ClientPrefs.noReset ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Кнопка перезапуска: < " + (!ClientPrefs.noReset ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class DistractionsAndEffectsOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		FlxG.save.data.distractions = !FlxG.save.data.distractions;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Distractions: < " + (!FlxG.save.data.distractions ? "off" : "on") + " >";
		
			case "Russian":
				edite = "Раздражители: < " + (!FlxG.save.data.distractions ? "Выкл" : "Вкл") + " >";
		}
		return edite;
	}
}

class Shouldcameramove extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function press():Bool
	{
		ClientPrefs.shouldcameramove= !ClientPrefs.shouldcameramove;
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Dynamic Camera: < " + (ClientPrefs.shouldcameramove ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Динамическая камера: < " + (ClientPrefs.shouldcameramove ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class InstantRespawn extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}


	public override function press():Bool
	{
		ClientPrefs.instantRespawn = !ClientPrefs.instantRespawn;
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Instant Respawn: < " + (ClientPrefs.instantRespawn ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Моментальное возрождение: < " + (ClientPrefs.instantRespawn ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class FlashingLightsOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.flashing = !ClientPrefs.flashing;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Flashing Lights: < " + (ClientPrefs.flashing ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Мигающие огни: < " + (ClientPrefs.flashing ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class AntialiasingOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.globalAntialiasing = !ClientPrefs.globalAntialiasing;
               // onChangeAntiAliasing();
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Antialiasing: < " + (ClientPrefs.globalAntialiasing ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Сглаживание < " + (ClientPrefs.globalAntialiasing ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}

       /* function onChangeAntiAliasing()
	{
		for (sprite in members)
		{
			var sprite:Dynamic = sprite; //Make it check for FlxSprite instead of FlxBasic
			var sprite:FlxSprite = sprite; //Don't judge me ok
			if(sprite != null && (sprite is FlxSprite) && !(sprite is FlxText)) {
				sprite.antialiasing = ClientPrefs.globalAntialiasing;
			}
		}
	} */
}

class MissSoundsOption extends Option
{
	public function new(desc:String)
	{
		super();
			description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.playmisssounds = !ClientPrefs.playmisssounds;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}
	
	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Miss Sounds: < " + (ClientPrefs.playmisssounds ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Звуки промаха: < " + (ClientPrefs.playmisssounds ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class MissAnimsOption extends Option
{
	public function new(desc:String)
	{
		super();
			description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.playmissanims = !ClientPrefs.playmissanims;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Miss Animations: < " + (ClientPrefs.playmissanims ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Анимации промаха: < " + (ClientPrefs.playmissanims ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class PauseCountDownOption extends Option
{
	public function new(desc:String)
	{
		super();
			description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.countdownpause = !ClientPrefs.countdownpause;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "AfterPause CountDown: < " + (ClientPrefs.countdownpause ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Обратный отсчет, после паузы : < " + (ClientPrefs.countdownpause ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class GreenScreenMode extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.greenscreenmode = !ClientPrefs.greenscreenmode;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Green Screen mode: < " + (ClientPrefs.greenscreenmode ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Зелёный экран: < " + (ClientPrefs.greenscreenmode ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class Judgement extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function press():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		OptionsMenu.instance.selectedCatIndex = 5;
		OptionsMenu.instance.switchCat(OptionsMenu.instance.options[5], false);
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Edit Judgements";
			
			case "Russian":
				edite = "Изменить точность";
		}
		return edite;
	}
}

class FPSOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{	
		ClientPrefs.showFPS = !ClientPrefs.showFPS;
		FPSMem.showFPS = ClientPrefs.showFPS;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "FPS Counter: < " + (FPSMem.showFPS ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Счетчик кадров в секунду: < " + (FPSMem.showFPS ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class MEMOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
	    ClientPrefs.showMEM = !ClientPrefs.showMEM;
        FPSMem.showMem =  ClientPrefs.showMEM;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Memory Counter: < " + (FPSMem.showMem ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Счетчик памяти в секунду: < " + (FPSMem.showMem ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class AutoPause extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.autoPause = !ClientPrefs.autoPause;
                FlxG.autoPause = ClientPrefs.autoPause;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "AutoPause: < " + (ClientPrefs.autoPause ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "АвтоПауза: < " + (ClientPrefs.autoPause ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class ShowSplashes extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
        ClientPrefs.noteSplashes = !ClientPrefs.noteSplashes;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "NoteSplashes: < " + (ClientPrefs.noteSplashes ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Всплеск нот: < " + (ClientPrefs.noteSplashes ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}
class QualityLow extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
             		if (OptionsMenu.isInPause)
			return false;
        ClientPrefs.lowQuality = !ClientPrefs.lowQuality;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Low Quality: < " + (ClientPrefs.lowQuality ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Низкое качество: < " + (ClientPrefs.lowQuality ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class FPSCapOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}

	public override function press():Bool
	{
		return false;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "FPS Cap: < " + ClientPrefs.framerate + " >";
		
			case "Russian":
				edite = "Ограничение FPS: < " + ClientPrefs.framerate + " >";
		}
		return edite;
	}

	override function right():Bool
	{
		if (ClientPrefs.framerate >= 290)
		{
			ClientPrefs.framerate = 290;
                        onChangeFramerate();
		}
		else
			ClientPrefs.framerate = ClientPrefs.framerate + 5;
		    onChangeFramerate();

		return true;
	}

	override function left():Bool
	{
		if (ClientPrefs.framerate > 290)
			ClientPrefs.framerate = 290;
		else if (ClientPrefs.framerate <= 60)
			ClientPrefs.framerate = Application.current.window.displayMode.refreshRate;
		else
			ClientPrefs.framerate = ClientPrefs.framerate - 5;
			onChangeFramerate();
		return true;
	}

    function onChangeFramerate()
	{
		if(ClientPrefs.framerate > FlxG.drawFramerate)
		{
			FlxG.updateFramerate = ClientPrefs.framerate;
			FlxG.drawFramerate = ClientPrefs.framerate;
		}
		else
		{
			FlxG.drawFramerate = ClientPrefs.framerate;
			FlxG.updateFramerate = ClientPrefs.framerate;
		}
	}

	override function getValue():String
	{
		return updateDisplay();
	}
}

class HideOppStrumsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.hideOpponenStrums = !ClientPrefs.hideOpponenStrums;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Opponent Strums: < " + (!ClientPrefs.hideOpponenStrums ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Ноты оппонента: < " + (!ClientPrefs.hideOpponenStrums ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class OffsetMenu extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press():Bool
	{
		trace("switch");

		PlayState.SONG = Song.loadFromJson('tutorial', '');
		PlayState.isStoryMode = false;
		PlayState.storyDifficulty = 0;
		PlayState.storyWeek = 0;
		//PlayState.offsetTesting = true;
		trace('CUR WEEK' + PlayState.storyWeek);
		LoadingState.loadAndSwitchState(new PlayState());
		return false;
	}

	private override function updateDisplay():String
	{
		return "Time your offset";
	}
}
class OffsetThing extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.noteOffset--;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.noteOffset++;
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Note offset: < " + Utils.truncateFloat(ClientPrefs.noteOffset, 0) + " >";
		
			case "Russian":
				edite = "Точность нот: < " + Utils.truncateFloat(ClientPrefs.noteOffset, 0) + " >";
		}
		return edite;
	}

	public override function getValue():String
	{
		return "Note offset: < " + Utils.truncateFloat(ClientPrefs.noteOffset, 0) + " >";
	}
} 

class CamZoomOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.camZooms = !ClientPrefs.camZooms;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Camera Zooming: < " + (ClientPrefs.camZooms ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Приближение камеры: < " + (ClientPrefs.camZooms ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class JudgementCounter extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.showjud = !ClientPrefs.showjud;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Judgement Counter: < " + (ClientPrefs.showjud ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Счётчик точности: < " + (ClientPrefs.showjud ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class Imagepersist extends Option
{
	public function new(desc:String)
	{
		super();
			description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.imagesPersist = !ClientPrefs.imagesPersist;
                FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Persistent Cached Data: < " + (ClientPrefs.imagesPersist ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Постоянное Кэшированные Данные: < " + (ClientPrefs.imagesPersist ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class ControllerMode extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.controllerMode = !ClientPrefs.controllerMode;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Controller Mode: < " + (ClientPrefs.controllerMode ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Режим контроллера: < " + (ClientPrefs.controllerMode ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class MiddleScrollOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.middleScroll = !ClientPrefs.middleScroll;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Middle Scroll: < " + (ClientPrefs.middleScroll ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Серединный скролл (MiddleScroll): < " + (ClientPrefs.middleScroll ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}


class NoteskinOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.noteSkinNum--;
		if (ClientPrefs.noteSkinNum < 0)
			ClientPrefs.noteSkinNum = OptionsHelpers.noteskinArray.length - 4;
     	OptionsHelpers.ChangeNoteSkin(ClientPrefs.noteSkinNum);
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.noteSkinNum++;
		if (ClientPrefs.noteSkinNum > OptionsHelpers.noteskinArray.length - 1)
			ClientPrefs.noteSkinNum = OptionsHelpers.noteskinArray.length - 1;
        OptionsHelpers.ChangeNoteSkin(ClientPrefs.noteSkinNum);
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Current Noteskin: < " + OptionsHelpers.getNoteskinByID(ClientPrefs.noteSkinNum) + " >";
		
			case "Russian":
				edite = "Выбранные ноты: < " + OptionsHelpers.getNoteskinByID(ClientPrefs.noteSkinNum) + " >";
		}
		return edite;
	}
}

class AccTypeOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.ratingSystemNum--;
		if (ClientPrefs.ratingSystemNum < 0)
			ClientPrefs.ratingSystemNum = OptionsHelpers.AccuracyTypeArray.length - 6;
     	OptionsHelpers.ChangeAccType(ClientPrefs.ratingSystemNum);
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.ratingSystemNum++;
		if (ClientPrefs.ratingSystemNum > OptionsHelpers.AccuracyTypeArray.length - 1)
			ClientPrefs.ratingSystemNum = OptionsHelpers.AccuracyTypeArray.length - 1;
        OptionsHelpers.ChangeAccType(ClientPrefs.ratingSystemNum);
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Current Accuracy Type: < " + OptionsHelpers.getAccTypeID(ClientPrefs.ratingSystemNum) + " >";
		
			case "Russian":
				edite = "Текущий Тип точности: < " + OptionsHelpers.getAccTypeID(ClientPrefs.ratingSystemNum) + " >";
		}
		return edite;
	}
}

class ColorBlindOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.ColorBlindTypeNum--;
		if (ClientPrefs.ColorBlindTypeNum < 0)
			ClientPrefs.ColorBlindTypeNum = OptionsHelpers.ColorBlindArray.length - 1;
        OptionsHelpers.ChangeColorBlind(ClientPrefs.ColorBlindTypeNum);
		ColorblindFilters.applyFiltersOnGame();
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.ColorBlindTypeNum++;
		if (ClientPrefs.ColorBlindTypeNum > OptionsHelpers.ColorBlindArray.length - 1)
			ClientPrefs.ColorBlindTypeNum = OptionsHelpers.ColorBlindArray.length - 4;
                  OptionsHelpers.ChangeColorBlind(ClientPrefs.ColorBlindTypeNum);
				  ColorblindFilters.applyFiltersOnGame();
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Color Blindness Type: < " + OptionsHelpers.getColorBlindByID(ClientPrefs.ColorBlindTypeNum) + " >";
		
			case "Russian":
				edite = "Тип дальтонизма: < " + OptionsHelpers.getColorBlindByID(ClientPrefs.ColorBlindTypeNum) + " >";
		}
		return edite;
	}
}

class IconBop extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.hliconbopNum--;
		if (ClientPrefs.hliconbopNum < 0)
		ClientPrefs.hliconbopNum = OptionsHelpers.IconsBopArray.length - 3;
     OptionsHelpers.ChangeIconBop(ClientPrefs.hliconbopNum);
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.hliconbopNum++;
		if (ClientPrefs.hliconbopNum > OptionsHelpers.IconsBopArray.length - 1)
			ClientPrefs.hliconbopNum = OptionsHelpers.IconsBopArray.length - 1;
        OptionsHelpers.ChangeIconBop(ClientPrefs.hliconbopNum);
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Icon bopping type: < " + OptionsHelpers.getIconBopByID(ClientPrefs.hliconbopNum) + " >";
		
			case "Russian":
				edite = "Выбранный танец иконок: < " + OptionsHelpers.getIconBopByID(ClientPrefs.hliconbopNum) + " >";
		}
		return edite;
	}
}

class TimeBarType extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.timeBarTypeNum--;
		if (ClientPrefs.timeBarTypeNum < 0)
			ClientPrefs.timeBarTypeNum = OptionsHelpers.TimeBarArray.length - 3;
     	OptionsHelpers.ChangeTimeBar(ClientPrefs.timeBarTypeNum);
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.timeBarTypeNum++;
		if (ClientPrefs.timeBarTypeNum > OptionsHelpers.TimeBarArray.length - 1)
			ClientPrefs.timeBarTypeNum = OptionsHelpers.TimeBarArray.length - 1;
        OptionsHelpers.ChangeTimeBar(ClientPrefs.timeBarTypeNum);
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Time bar type: < " + OptionsHelpers.getTimeBarByID(ClientPrefs.timeBarTypeNum) + " >";
		
			case "Russian":
				edite = "Тип временной шкалы: < " + OptionsHelpers.getTimeBarByID(ClientPrefs.timeBarTypeNum) + " >";
		}
		return edite;
	}
}

class HealthBarOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
	}

	public override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.visibleHealthbar = !ClientPrefs.visibleHealthbar;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Health Bar: < " + (ClientPrefs.visibleHealthbar ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Полоса здоровья: < " + (ClientPrefs.visibleHealthbar ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class HealthBarAlpha extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
			acceptValues = true;
	}

	override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.healthBarAlpha += 0.1;
		if (ClientPrefs.healthBarAlpha > 1)
			ClientPrefs.healthBarAlpha = 1;
		return true;
	}

	override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.healthBarAlpha -= 0.1;

		if (ClientPrefs.healthBarAlpha < 0)
			ClientPrefs.healthBarAlpha = 0;

		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Healthbar Transparceny: < " + Utils.truncateFloat(ClientPrefs.healthBarAlpha, 1) + " >";
		
			case "Russian":
				edite = "Прозрачность полосы здоровья: < " + Utils.truncateFloat(ClientPrefs.healthBarAlpha, 1) + " >";
		}
		return edite;
	}
}

class SustainsAlpha extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
			acceptValues = true;
	}


	override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.susTransper += 0.1;

		if (ClientPrefs.susTransper > 1)
			ClientPrefs.susTransper = 1;
		return true;
	}

	override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.susTransper -= 0.1;

		if (ClientPrefs.susTransper < 0)
			ClientPrefs.susTransper = 0;

		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Sustain Notes Transparceny: < " + Utils.truncateFloat(ClientPrefs.susTransper, 1) + " >";
		
			case "Russian":
				edite = "Прозрачность нот: < " + Utils.truncateFloat(ClientPrefs.susTransper, 1) + " >";
		}
		return edite;
	}
}

class HitSoundOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "HitSound volume: < " + Utils.truncateFloat(ClientPrefs.hsvol, 1) + " >";
		
			case "Russian":
				edite = "Громкость звука нажатия: < " + Utils.truncateFloat(ClientPrefs.hsvol, 1) + " >";
		}
		return edite;
	}

	override function right():Bool
	{
		ClientPrefs.hsvol += 0.1;
		if (ClientPrefs.hsvol > 1)
			ClientPrefs.hsvol = 1;
                FlxG.sound.play(Paths.sound('note_click'), ClientPrefs.hsvol);
		return true;

	}

	override function left():Bool
	{
		ClientPrefs.hsvol -= 0.1;
		if (ClientPrefs.hsvol < 0)
			ClientPrefs.hsvol = 0;
                FlxG.sound.play(Paths.sound('note_click'), ClientPrefs.hsvol);
		return true;
	}
}

class LaneUnderlayOption extends Option
{
	var notPause:String = "";

	public function new(desc:String)
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				notPause = "This option cannot be toggled in the pause menu.";
			
			case "Russian":
				notPause = "Эта опция не может быть изменена в паузе.";
		}

		super();
            if (OptionsMenu.isInPause)
				description = notPause;
			else
				description = desc;
			acceptValues = true;
	}


	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Lane Transparceny: < " + Utils.truncateFloat(ClientPrefs.underdelayalpha, 1) + " >";
		
			case "Russian":
				edite = "Прозрачность фона: < " + Utils.truncateFloat(ClientPrefs.underdelayalpha, 1) + " >";
		}
		return edite;
	}

	override function right():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.underdelayalpha += 0.1;

		if (ClientPrefs.underdelayalpha > 1)
			ClientPrefs.underdelayalpha = 1;
		return true;
	}

	override function left():Bool
	{
		if (OptionsMenu.isInPause)
			return false;
		ClientPrefs.underdelayalpha -= 0.1;

		if (ClientPrefs.underdelayalpha < 0)
			ClientPrefs.underdelayalpha = 0;

		return true;
	}
}

class SongNameOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.songNameDisplay = !ClientPrefs.songNameDisplay;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "SongName Displayed: < " + (ClientPrefs.songNameDisplay ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Показ название песни: < " + (ClientPrefs.songNameDisplay ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class VintageOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.vintageOnGame = !ClientPrefs.vintageOnGame;
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		left();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Vintage: < " + (ClientPrefs.vintageOnGame ? "Enabled" : "Disabled") + " >";
		
			case "Russian":
				edite = "Винтаж: < " + (ClientPrefs.vintageOnGame ? "Вкл" : "Выкл") + " >";
		}
		return edite;
	}
}

class ChangeLanguage extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left():Bool
	{
		ClientPrefs.languageNameNum--;
		if (ClientPrefs.languageNameNum < 0)
		ClientPrefs.languageNameNum = OptionsHelpers.languageNames.length - 1;
     OptionsHelpers.ChangeLanguage(ClientPrefs.languageNameNum);
		display = updateDisplay();
		return true;
	}

	public override function right():Bool
	{
		ClientPrefs.languageNameNum++;
		if (ClientPrefs.languageNameNum > OptionsHelpers.languageNames.length - 1)
			ClientPrefs.languageNameNum = OptionsHelpers.languageNames.length - 1;
        OptionsHelpers.ChangeLanguage(ClientPrefs.languageNameNum);
		display = updateDisplay();
		return true;
	}

	var edite:String = "";

	private override function updateDisplay():String
	{
		switch(ClientPrefs.languageName)
		{
			case 'English':
				edite = "Language: < " + OptionsHelpers.getLanguageByID(ClientPrefs.languageNameNum) + " >";
		
			case "Russian":
				edite = "Язык: < " + OptionsHelpers.getLanguageByID(ClientPrefs.languageNameNum) + " >";
		}
		return edite;
	}
}

