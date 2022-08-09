package grafex.states.options;

import grafex.states.options.substates.NoteOffsetState;
import grafex.states.substates.PauseSubState;
import grafex.states.options.substates.NotesSubState;
import grafex.systems.statesystem.MusicBeatState;
import grafex.states.substates.LoadingState;
import grafex.systems.Paths;

import flixel.FlxSubState;
import flixel.input.gamepad.FlxGamepad;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.Lib;
import grafex.states.options.substates.Options;
import grafex.states.options.substates.ControlsSubState;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.util.FlxSave;

class OptionCata extends FlxSprite
{
	public var title:String;
	public var options:Array<Option>;

	public var optionObjects:FlxTypedGroup<FlxText>;

	public var titleObject:FlxText;

	public var middle:Bool = false;

	public function new(x:Float, y:Float, _title:String, _options:Array<Option>, middleType:Bool = false)
	{
		super(x, y);
		title = _title;
		middle = middleType;
		if (!middleType)
			makeGraphic(295, 64, FlxColor.BLACK);
		alpha = 0.4;

		options = _options;

		optionObjects = new FlxTypedGroup();

		titleObject = new FlxText((middleType ? 1180 / 2 : x), y + (middleType ? 0 : 16), 0, title);
		titleObject.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		titleObject.borderSize = 3;

		if (middleType)
		{
			titleObject.x = 50 + ((1180 / 2) - (titleObject.fieldWidth / 2));
		}
		else
			titleObject.x += (width / 2) - (titleObject.fieldWidth / 2);

		titleObject.scrollFactor.set();

		scrollFactor.set();

		for (i in 0...options.length)
		{
			var opt = options[i];
			var text:FlxText = new FlxText((middleType ? 1180 / 2 : 72), titleObject.y + 54 + (46 * i), 0, opt.getValue());
			if (middleType)
			{
				text.screenCenter(X);
			}
			text.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			text.borderSize = 3;
			text.borderQuality = 1;
			text.scrollFactor.set();
			optionObjects.add(text);
		}
	}

	public function changeColor(color:FlxColor)
	{
		makeGraphic(295, 64, color);
	}
}

class OptionsMenu extends FlxSubState
{
	public static var instance:OptionsMenu;

	public var background:FlxSprite;

	public var selectedCat:OptionCata;

	public var selectedOption:Option;

	public var selectedCatIndex = 0;
	public var selectedOptionIndex = 0;

	public var isInCat:Bool = false;

	public var options:Array<OptionCata>;

	public static var isInPause = false;

	var restoreSettingsText:FlxText;

	public var shownStuff:FlxTypedGroup<FlxText>;

	public static var visibleRange = [114, 640];

	var startSong = true;

	public function new(pauseMenu:Bool = false)
	{
		super();

		isInPause = pauseMenu;
	}

	public var menu:FlxTypedGroup<FlxSprite>;

	public var descText:FlxText;
	public var descBack:FlxSprite;

	var txtGameplay:String = "";
	var txtg1:String = "";
	var txtg2:String = "";
	var txtg3:String = "";
	var txtg4:String = "";
	var txtg5:String = "";
	var txtg6:String = "";
	var txtg7:String = "";
	var txtg8:String = "";

	var txtAppearance:String = "";
	var txta1:String = "";
	var txta2:String = "";
	var txta3:String = "";
	var txta4:String = "";
	var txta5:String = "";
	var txta6:String = "";
	var txta7:String = "";
	var txta8:String = "";
	var txta9:String = "";
	var txta10:String = "";
	var txta11:String = "";
	var txta12:String = "";
	var txta13:String = "";
	var txta14:String = "";
	var txta15:String = "";
	var txta16:String = "";
	var txta17:String = "";
	var txta18:String = "";
	var txta19:String = "";
	var txtMisc:String = "";
	var txtm1:String = "";
	var txtm2:String = "";
	var txtm3:String = "";
	var txtm4:String = "";
	var txtm5:String = "";
	var txtm6:String = "";
	var txtm7:String = "";
	var txtm8:String = "";
	var txtm9:String = "";
	var txtm10:String = "";
	var txtm11:String = "";
	var txtExtra:String = "";
	var txte1:String = "";
	var txte2:String = "";
	var txte3:String = "";
	var txte4:String = "";
	var txte5:String = "";
	var txtKey:String = "";
	var txtJud:String = "";
	var txtj1:String = "";
	var txtj2:String = "";
	var txtj3:String = "";
/*
	var txt1:String = "";
*/

	override function create()
	{

		switch(ClientPrefs.languageName)
		{
			case 'English':
				txtGameplay = "Gameplay"; //Gameplay
				txtg1 = "Adds 'hitsound' on note hits.";
				txtg2 = "Toggle counting pressing a directional input when no arrow is there as a miss.";
				txtg3 = "Toggle making the notes scroll down rather than up.";
				txtg4 = "Toggle pressing R to gameover.";
				txtg5 = "Toggle if you instantly respawn after dying.";
				txtg6 = "Toggle the camera zoom in-game.";
				txtg7 = "Create a custom judgement preset";
				txtg8 = "Moves camera on opponent/player note hits.";

				txtAppearance = "Appearance"; //Appearance
				txta1 = "Change your current noteskin";
				txta2 = "Change your current accuracy type you want!";
				txta3 = "Change icon bopping type";
				txta4 = "Shows to you name of song your playing on HUD";
				txta5 = "Put your lane in the center or on the right.";
				txta6 = "Shows/Hides opponent strums on screen.(RESTART SONG)";
				txta7 = "Toggle miss sounds playing when you don't hit a note.";
				txta8 = "Toggle miss animations playing when you don't hit a note.";
				txta9 = "Show particles on SICK hit.";
				txta10 = "Enables filter like in MicedUp Engine.";
				txta11 = "Toggles health bar visibility";
				txta12 = "Show your judgements that you've gotten in the song";
				txta13 = "How transparent your lane is, higher = more visible.";
				txta14 = "Shows to you hud.";
				txta15 = "Combo sprite appearance.";
				txta16 = "Zoom score on 2'nd beat.";
				txta17 = "Healthbar Transparceny.";
				txta18 = "(CONTAINS FPS ISSUES)/Make notes a bit 'blurred'.";
				txta19 = "Change the song's current position bar.";

				txtMisc = "Misc"; //Misc
				txtm1 = "Toggle flashing lights that can cause epileptic seizures and strain.";
				txtm2 = "You can set colorblind filter (makes the game more playable for colorblind people).";
				txtm3 = "Toggle the FPS Counter.";
				txtm4 = "Toggle the MEM Counter.";
				txtm5 = "Change your FPS Cap.";
				txtm6 = "Stops game, when its unfocused";
				txtm7 = "Adds 'vintage' on game screen.";
				txtm8 = "Toggle antialiasing, improving graphics quality at a slight performance penalty.";
				txtm9 = "Turn off some object on stages";
				txtm10 = "Images loaded will stay in memory until the game is closed.";
				txtm11 = "Makes screen green.";

				txtExtra = "Extra"; //Extra
				txte1 = "Change Language. :D";
				txte2 = "Turn AutoSaves your chating in Charting state.";
				txte3 = "Change Chart AutoSave Interval.";
				txte4 = "Skips TitleState.";
				txte5 = "Toggle countdown after pressing 'Resume' in Pause Menu.";

				txtKey = "Editing Keybinds";

				txtJud = "Editing Judgements";
				txtj1 = "How many milliseconds are in the SICK hit window";
				txtj2 = "How many milliseconds are in the GOOD hit window";
				txtj3 = "How many milliseconds are in the BAD hit window";

			case "Russian":
				txtGameplay = "Геймплей"; //Геймплей
				txtg1 = "Добавляет звук при нажатии ноты.";
				txtg2 = "Если включено, не реагирует на промахи, когда стрелка отсутствует.";
				txtg3 = "Перемещает стрелки вниз (Нижний скролл)";
				txtg4 = "При нажатии на R, вы погибаете. ";
				txtg5 = "После смерти, вы моментально возраждаетесь.";
				txtg6 = "Включить или выключить масштабирование камеры";
				txtg7 = "Изменить задержку ввода. ";
				txtg8 = "Передвигать камеру при нажатии нот.";

				txtAppearance = "Дизайн"; //Дизайн
				txta1 = "Измени дизайн стрелок!";
				txta2 = "Измени точность, как ты хочешь!";
				txta3 = "Измени танец иконок.";
				txta4 = "Показывает название песни на экране.";
				txta5 = "Поставь свои ноты по середине или справа (Мидл скролл).";
				txta6 = "Показывать/спрятать ноты опонента. (ПЕРЕЗАПУСК ПЕСНИ)";
				txta7 = "Если вы не нажали на ноту, то звук не будет издаваться.";
				txta8 = "Отключает анимации промаха.";
				txta9 = "Показывать партеклы при нажатии на SICK.";
				txta10 = "Включает фильтр как на MicedUp Engine.";
				txta11 = "Переключает видимость панели здоровья";
				txta12 = "Показывает вашу точность, которую вы получили в песне.";
				txta13 = "Задний фон для стрелок, больше = виднее.";
				txta14 = "Показывавает твой интерфейс.";
				txta15 = "Включает 'Комбо' спрайт.";
				txta16 = "Приближает счет на 2-м ударе.";
				txta17 = "Прозрачность панели здоровья.";
				txta18 = "(СОДЕРЖИТ ПРОБЛЕМЫ С кадрами в СЕКУНДУ)/ Сделайте ноты немного 'размытыми'.";
				txta19 = "Изменяет показ времени песни.";

				txtMisc = "Разное"; //Разное
				txtm1 = "Переключайте мигающие огни, которые могут вызвать эпилептические припадки и напряжение.";
				txtm2 = "Вы можете установить фильтр дальтонизма (делает игру более воспроизводимой для дальтоников).";
				txtm3 = "Включает ФПС индикатор.";
				txtm4 = "Включает ПАМ индикатор.";
				txtm5 = "Измените свой предел ФПС.";
				txtm6 = "Останавливает игру, когда она расфокусирована.";
				txtm7 = "Добавляет 'винтаж' на игровой экран.";
				txtm8 = "Переключение сглаживания, улучшающее качество графики при незначительном снижении производительности.";
				txtm9 = "Отключить какой-либо объект на этапах";
				txtm10 = "Загруженные изображения будут оставаться в памяти до тех пор, пока игра не будет закрыта.";
				txtm11 = "Делает зелёный экран.";
				
				txtExtra = "Экстра"; //Экстра
				txte1 = "Поменяй свой язык :D";
				txte2 = "Включи автосохранение чартинга в режиме чартинга!";
				txte3 = "Изменяет время авточартинга.";
				txte4 = "Пропускать TitleState.";
				txte5 = "Включайте/Выключайте обратный отчёт при возобновлении с паузы";

				txtKey = "Измените управление.";

				txtJud = "Измените точность.";
				txtj1 = "Сколько миллисекунд находится в окне 'SICK' попадания";
				txtj2 = "Сколько миллисекунд находится в окне 'GOOD' попадания";
				txtj3 = "Сколько миллисекунд находится в окне 'BAD' попадания";
		}

		if (!isInPause)
		  if(!ControlsSubState.fromcontrols)
			if(startSong)
				FlxG.sound.playMusic(Paths.music('optionsSong'));
			else
				startSong = true;


		options = [
			new OptionCata(50, 40, txtGameplay, [
				//new OffsetThing("Change the note visual offset (how many milliseconds a note looks like it is offset in a chart)"),
				new HitSoundOption(txtg1),
				new GhostTapOption(txtg2),
				new DownscrollOption(txtg3),
				new NoReset(txtg4),
				new InstantRespawn(txtg5),
				new CamZoomOption(txtg6),
                new DFJKOption(),
                new NotesOption(),
                new Customizeption(),
				new Judgement(txtg7),
				new Shouldcameramove(txtg8),
			]),
			new OptionCata(345, 40, txtAppearance, [
                new NoteskinOption(txta1),
				new AccTypeOption(txta2),
                new IconBop(txta3),
				new SongNameOption(txta4),
				new MiddleScrollOption(txta5), 
				new HideOppStrumsOption(txta6),
				new MissSoundsOption(txta7),
				new MissAnimsOption(txta8),
                new ShowSplashes(txta9),
                new MicedUpSusOption(txta10),
               // new SustainsAlpha("Change Sustain Notes Alpha."),
				new HealthBarOption(txta11),
				new JudgementCounter(txta12),
				new LaneUnderlayOption(txta13),
                new HideHud(txta14),
                new ShowCombo(txta15),
                new ScoreZoom(txta16),
                new HealthBarAlpha(txta17),
                new BlurNotes(txta18),
			    new TimeBarType(txta19),
			]),
			new OptionCata(640, 40, txtMisc, [
				new FlashingLightsOption(txtm1),
				new ColorBlindOption(txtm2),
				new FPSOption(txtm3),
                new MEMOption(txtm4),
				#if desktop new FPSCapOption(txtm5),
				#end
                new AutoPause(txtm6),
				new VintageOption(txtm7),
                new AntialiasingOption(txtm8),
                new QualityLow(txtm9),
				new Imagepersist(txtm10),
				new GreenScreenMode(txtm11),
        		]),
			new OptionCata(935, 40, txtExtra, [
				//new ResetSettings("Reset some your settings. This is irreversible!")
				new ChangeLanguage(txte1),
				new AutoSave(txte2),
				new AutoSaveInt(txte3),
                new SkipTitleOption(txte4),
			    new PauseCountDownOption(txte5),
			]),
			new OptionCata(-1, 125, txtKey, [/* nothing here lol - PurSnake*/], true),

			new OptionCata(-1, 125, txtJud, [
				new SickMSOption(txtj1),
				new GoodMsOption(txtj2),
				new BadMsOption(txtj3),
			], true)
		];

		instance = this;

		menu = new FlxTypedGroup<FlxSprite>();

		shownStuff = new FlxTypedGroup<FlxText>();

		background = new FlxSprite(50, 40).makeGraphic(1180, 640, FlxColor.BLACK);
		background.alpha = 0.5;
		background.scrollFactor.set();
		menu.add(background);

		descBack = new FlxSprite(50, 640).makeGraphic(1180, 38, FlxColor.BLACK);
		descBack.alpha = 0.3;
		descBack.scrollFactor.set();
		menu.add(descBack);

		if (isInPause)
		{
			var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
			bg.alpha = 0;
			bg.scrollFactor.set();
			menu.add(bg);

			background.alpha = 0.5;
			bg.alpha = 0.6;

			cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		}

		selectedCat = options[0];

		selectedOption = selectedCat.options[0];

		add(menu);

		add(shownStuff);

		for (i in 0...options.length - 1)
		{
			if (i >= 4)
				continue;
			var cat = options[i];
			add(cat);
			add(cat.titleObject);
		}

		descText = new FlxText(62, 648);
		descText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.borderSize = 2;

		add(descBack);
		add(descText);

		isInCat = true;

		switchCat(selectedCat);

		selectedOption = selectedCat.options[0];

		restoreSettingsText = new FlxText (62, 680, FlxG.width, 'Press DELETE to reset settings');
		restoreSettingsText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		restoreSettingsText.scrollFactor.set();
		restoreSettingsText.borderSize = 2;
		restoreSettingsText.borderQuality = 3;
		add(restoreSettingsText);

		super.create();
	}

	public function switchCat(cat:OptionCata, checkForOutOfBounds:Bool = true)
	{
		try
		{
			visibleRange = [114, 640];
			if (cat.middle)
				visibleRange = [Std.int(cat.titleObject.y), 640];
			if (selectedOption != null)
			{
				var object = selectedCat.optionObjects.members[selectedOptionIndex];
				object.text = selectedOption.getValue();
			}

			if (selectedCatIndex > options.length - 3 && checkForOutOfBounds)
				selectedCatIndex = 0;

			if (selectedCat.middle)
				remove(selectedCat.titleObject);

			selectedCat.changeColor(FlxColor.BLACK);
			selectedCat.alpha = 0.3;

			for (i in 0...selectedCat.options.length)
			{
				var opt = selectedCat.optionObjects.members[i];
				opt.y = selectedCat.titleObject.y + 54 + (46 * i);
			}

			while (shownStuff.members.length != 0)
			{
				shownStuff.members.remove(shownStuff.members[0]);
			}
			selectedCat = cat;
			selectedCat.alpha = 0.2;
			selectedCat.changeColor(FlxColor.WHITE);

			if (selectedCat.middle)
				add(selectedCat.titleObject);

			for (i in selectedCat.optionObjects)
				shownStuff.add(i);

			selectedOption = selectedCat.options[0];

			if (selectedOptionIndex > options[selectedCatIndex].options.length - 1)
			{
				for (i in 0...selectedCat.options.length)
				{
					var opt = selectedCat.optionObjects.members[i];
					opt.y = selectedCat.titleObject.y + 54 + (46 * i);
				}
			}

			selectedOptionIndex = 0;

			if (!isInCat)
				selectOption(selectedOption);

			for (i in selectedCat.optionObjects.members)
			{
				if (i.y < visibleRange[0] - 24)
					i.alpha = 0;
				else if (i.y > visibleRange[1] - 24)
					i.alpha = 0;
				else
				{
					i.alpha = 0.4;
				}
			}
		}
		catch (e)
		{
			selectedCatIndex = 0;
		}
	}

	public function selectOption(option:Option)
	{
		var object = selectedCat.optionObjects.members[selectedOptionIndex];

		selectedOption = option;

		if (!isInCat)
		{
			object.text = option.getValue();

			descText.text = option.getDescription();
		}
	}

	public static function openControllsState()
		{
			MusicBeatState.switchState(new ControlsSubState());
			ClientPrefs.saveSettings();
		}

	public static function openNotesState()
		{
			MusicBeatState.switchState(new NotesSubState());
			ClientPrefs.saveSettings();
		}

    public static function openAjustState()
		{
			LoadingState.loadAndSwitchState(new NoteOffsetState());
			ClientPrefs.saveSettings();
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (c in options) {
			c.titleObject.text = c.title;
			for (o in 0...c.optionObjects.length) {
				c.optionObjects.members[o].text = c.options[o].getValue();
			}
		}

		if(FlxG.keys.justPressed.F11)
			{
			FlxG.fullscreen = !FlxG.fullscreen;
			}

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		var accept = false;
		var right = false;
		var left = false;
		var up = false;
		var down = false;
		var any = false;
		var escape = false;
		var reset = false;

		accept = FlxG.keys.justPressed.ENTER || (gamepad != null ? gamepad.justPressed.A : false);
		right = FlxG.keys.justPressed.RIGHT || (gamepad != null ? gamepad.justPressed.DPAD_RIGHT : false);
		left = FlxG.keys.justPressed.LEFT || (gamepad != null ? gamepad.justPressed.DPAD_LEFT : false);
		up = FlxG.keys.justPressed.UP || (gamepad != null ? gamepad.justPressed.DPAD_UP : false);
		down = FlxG.keys.justPressed.DOWN || (gamepad != null ? gamepad.justPressed.DPAD_DOWN : false);

		any = FlxG.keys.justPressed.ANY || (gamepad != null ? gamepad.justPressed.ANY : false);
		escape = FlxG.keys.justPressed.ESCAPE || (gamepad != null ? gamepad.justPressed.B : false);
		reset = FlxG.keys.justPressed.DELETE;

		if (selectedCat != null && !isInCat)
		{
			for (i in selectedCat.optionObjects.members)
			{
				if (selectedCat.middle)
				{
					i.screenCenter(X);
				}

				// I wanna die!!!
				if (i.y < visibleRange[0] - 24)
					i.alpha = 0;
				else if (i.y > visibleRange[1] - 24)
					i.alpha = 0;
				else
				{
					if (selectedCat.optionObjects.members[selectedOptionIndex].text != i.text)
						i.alpha = 0.4;
					else
						i.alpha = 1;
				}
			}
		}

		try
		{
			if (isInCat)
			{
				descText.text = "Please select a category";
				if (right)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
					selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
					selectedCatIndex++;

					if (selectedCatIndex > options.length - 3)
						selectedCatIndex = 0;
					if (selectedCatIndex < 0)
						selectedCatIndex = options.length - 3;

					switchCat(options[selectedCatIndex]);
				}
				else if (left)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
					selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
					selectedCatIndex--;

					if (selectedCatIndex > options.length - 3)
						selectedCatIndex = 0;
					if (selectedCatIndex < 0)
						selectedCatIndex = options.length - 3;

					switchCat(options[selectedCatIndex]);
				}

				if (accept)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
					selectedOptionIndex = 0;
					isInCat = false;
					selectOption(selectedCat.options[0]);
				}

				if(reset)
				{
					if (!isInPause)
					{
						resetOptions();
						restoreSettingsText.text = 'Settings restored // Restarting game';
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
						new FlxTimer().start(1.5, function(tmr:FlxTimer)
						{
							TitleState.initialized = false;
                            TitleState.closedState = false;
                            FlxG.sound.music.fadeOut(0.3);
                            FlxG.camera.fade(FlxColor.BLACK, 0.5, false, FlxG.resetGame, false);
						});
					}
					else
					{
						restoreSettingsText.text = 'Unable in PauseMenu';
					}
				}

				if (escape)
				{
					if (!isInPause) {
					    ClientPrefs.saveSettings();
						MusicBeatState.switchState(new MainMenuState());
                        FlxG.sound.music.stop();
						ControlsSubState.fromcontrols = false;
					    }
					else
					{
						PauseSubState.goBack = true;
						ClientPrefs.saveSettings();
						close();
					}
				}
			}
			else
			{
				if (selectedOption != null)
					if (selectedOption.acceptType)
					{
						if (escape && selectedOption.waitingType)
						{
							FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
							selectedOption.waitingType = false;
							var object = selectedCat.optionObjects.members[selectedOptionIndex];
							object.text = selectedOption.getValue();
							//Debug.logTrace("New text: " + object.text);
							return;
						}
						else if (any)
						{
							var object = selectedCat.optionObjects.members[selectedOptionIndex];
							selectedOption.onType(gamepad == null ? FlxG.keys.getIsDown()[0].ID.toString() : gamepad.firstJustPressedID());
							object.text = selectedOption.getValue();
						//	Debug.logTrace("New text: " + object.text);
						}
					}
				if (selectedOption.acceptType || !selectedOption.acceptType)
				{
					if (accept)
					{
						var prev = selectedOptionIndex;
						var object = selectedCat.optionObjects.members[selectedOptionIndex];
						selectedOption.press();

						if (selectedOptionIndex == prev)
						{
							ClientPrefs.saveSettings();

							object.text = selectedOption.getValue();
						}
					}

					if (down)
					{
						if (selectedOption.acceptType)
							selectedOption.waitingType = false;
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
						selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
						selectedOptionIndex++;

						// just kinda ignore this math lol

						if (selectedOptionIndex > options[selectedCatIndex].options.length - 1)
						{
							for (i in 0...selectedCat.options.length)
							{
								var opt = selectedCat.optionObjects.members[i];
								opt.y = selectedCat.titleObject.y + 54 + (46 * i);
							}
							selectedOptionIndex = 0;
						}

						if (selectedOptionIndex != 0
							&& selectedOptionIndex != options[selectedCatIndex].options.length - 1
							&& options[selectedCatIndex].options.length > 6)
						{
							if (selectedOptionIndex >= (options[selectedCatIndex].options.length - 1) / 2)
								for (i in selectedCat.optionObjects.members)
								{
									i.y -= 46;
								}
						}

						selectOption(options[selectedCatIndex].options[selectedOptionIndex]);
					}
					else if (up)
					{
						if (selectedOption.acceptType)
							selectedOption.waitingType = false;
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
						selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
						selectedOptionIndex--;

						// just kinda ignore this math lol

						if (selectedOptionIndex < 0)
						{
							selectedOptionIndex = options[selectedCatIndex].options.length - 1;

							if (options[selectedCatIndex].options.length > 6)
								for (i in selectedCat.optionObjects.members)
								{
									i.y -= (46 * ((options[selectedCatIndex].options.length - 1) / 2));
								}
						}

						if (selectedOptionIndex != 0 && options[selectedCatIndex].options.length > 6)
						{
							if (selectedOptionIndex >= (options[selectedCatIndex].options.length - 1) / 2)
								for (i in selectedCat.optionObjects.members)
								{
									i.y += 46;
								}
						}

						if (selectedOptionIndex < (options[selectedCatIndex].options.length - 1) / 2)
						{
							for (i in 0...selectedCat.options.length)
							{
								var opt = selectedCat.optionObjects.members[i];
								opt.y = selectedCat.titleObject.y + 54 + (46 * i);
							}
						}

						selectOption(options[selectedCatIndex].options[selectedOptionIndex]);
					}

					if (right)
					{
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
						var object = selectedCat.optionObjects.members[selectedOptionIndex];
						selectedOption.right();

						ClientPrefs.saveSettings();

						object.text = selectedOption.getValue();
						//Debug.logTrace("New text: " + object.text);
					}
					else if (left)
					{
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
						var object = selectedCat.optionObjects.members[selectedOptionIndex];
						selectedOption.left();

						ClientPrefs.saveSettings();

						object.text = selectedOption.getValue();
						//Debug.logTrace("New text: " + object.text);
					}

					if(reset)
					{
						if (!isInPause)
						{
							resetOptions();
							restoreSettingsText.text = 'Settings restored // Restarting game';
							FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
							new FlxTimer().start(1.5, function(tmr:FlxTimer)
							{
								TitleState.initialized = false;
                                TitleState.closedState = false;
                                FlxG.sound.music.fadeOut(0.3);
                                FlxG.camera.fade(FlxColor.BLACK, 0.5, false, FlxG.resetGame, false);
							});
						}
						else
						{
							restoreSettingsText.text = 'Unable in PauseMenu';
						}
					}

					if (escape)
					{
						FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);

						if (selectedCatIndex >= 4)
							selectedCatIndex = 0;

						for (i in 0...selectedCat.options.length)
						{
							var opt = selectedCat.optionObjects.members[i];
							opt.y = selectedCat.titleObject.y + 54 + (46 * i);
						}
						selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
						isInCat = true;
						if (selectedCat.optionObjects != null)
							for (i in selectedCat.optionObjects.members)
							{
								if (i != null)
								{
									if (i.y < visibleRange[0] - 24)
										i.alpha = 0;
									else if (i.y > visibleRange[1] - 24)
										i.alpha = 0;
									else
									{
										i.alpha = 0.4;
									}
								}
							}
						if (selectedCat.middle)
							switchCat(options[0]);
					}
				}
			}
		}
		catch (e)
		{
			//Debug.logError("wtf we actually did something wrong, but we dont crash bois.\n" + e);
            FlxG.log.add("wtf we actually did something wrong, but we dont crash bois.\n" + e);
			selectedCatIndex = 0;
			selectedOptionIndex = 0;
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.6);
			if (selectedCat != null)
			{
				for (i in 0...selectedCat.options.length)
				{
					var opt = selectedCat.optionObjects.members[i];
					opt.y = selectedCat.titleObject.y + 54 + (46 * i);
				}
				selectedCat.optionObjects.members[selectedOptionIndex].text = selectedOption.getValue();
				isInCat = true;
			}
		}
	}

	public static function resetOptions()
	{
		FlxG.save.data.autoPause = null;
		FlxG.save.data.visibleHealthbar = null;
		FlxG.save.data.showjud = null;
        FlxG.save.data.showCombo = null;
        FlxG.save.data.blurNotes = null;
		FlxG.save.data.playmissanims = null;
        FlxG.save.data.instantRespawn = null;
        FlxG.save.data.playmisssounds = null;
        FlxG.save.data.greenscreenmode = null;
        FlxG.save.data.hitsound = null;
        FlxG.save.data.shouldcameramove = null;
        FlxG.save.data.hliconbop = null;
        FlxG.save.data.hliconbopNum = null;
        FlxG.save.data.noteSkin = null;
        FlxG.save.data.noteSkinNum = null;
		FlxG.save.data.chartautosaveInterval = null;
        FlxG.save.data.skipTitleState = null;
		FlxG.save.data.chartautosave = null;
        FlxG.save.data.downScroll = null;
		FlxG.save.data.ratingSystem = null;
		FlxG.save.data.ratingSystemNum = null;
 		FlxG.save.data.SusTransper = null;
		FlxG.save.data.songNameDisplay = null;
		FlxG.save.data.vintageOnGame = null;
 		FlxG.save.data.micedUpSus = null;
		FlxG.save.data.middleScroll = null;
		FlxG.save.data.countdownpause = null;
		FlxG.save.data.showFPS = null;
        FlxG.save.data.showMEM = null;
		FlxG.save.data.flashing = null;
		FlxG.save.data.globalAntialiasing = null;
		FlxG.save.data.noteSplashes = null;
		FlxG.save.data.lowQuality = null;
		FlxG.save.data.framerate = null;
		FlxG.save.data.ColorBlindType = null;
		FlxG.save.data.camZooms = null;
		FlxG.save.data.noteOffset = null;
		FlxG.save.data.hideHud = null;
		FlxG.save.data.arrowHSV = null;
		FlxG.save.data.imagesPersist = null;
		FlxG.save.data.ghostTapping = null;
		FlxG.save.data.timeBarType = null;
		FlxG.save.data.timeBarTypeNum = null;
		FlxG.save.data.scoreZoom = null;
		FlxG.save.data.noReset = null;
        FlxG.save.data.underdelayalpha = null;
        FlxG.save.data.underdelayonoff = null;
		FlxG.save.data.hideOpponenStrums = null;
		FlxG.save.data.healthBarAlpha = 1;
        FlxG.save.data.hsvol = null;
		FlxG.save.data.comboOffset = null;
		FlxG.save.data.ratingOffset = null;
		FlxG.save.data.sickWindow = null;
		FlxG.save.data.goodWindow = null;
		FlxG.save.data.badWindow = null;
		FlxG.save.data.safeFrames = null;
		FlxG.save.data.gameplaySettings = null;
		FlxG.save.data.controllerMode = null;
		FlxG.save.data.customControls = ClientPrefs.keyBinds;
	
        ClientPrefs.loadPrefs();

	}
}

