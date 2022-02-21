;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Variables///Variables///Variables///Variables///Variables///Variables///Variables///Variables///Variables/////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////


dark_red = {&}4&l
red = {&}c&l
gold = {&}6&l
yellow = {&}e&l
dark_green = {&}2&l
green = {&}a&l
aqua = {&}b&l
dark_aqua = {&}3&l
dark_blue = {&}1&l
blue = {&}9&l
light_purple = {&}d&l
dark_purple = {&}5&l
white = {&}f&l
gray = {&}7&l
dark_gray = {&}8&l
black = {&}0&l


main_color_cfg = %white%
cooldown_zag = 30000
version_zag = 1.4

Text1 = {!}%main_color%Надоели скучные кланы{?} Пропадает интерес к игре{?} Тогда тебе к нам в клан{!} {/}warp fckcorp, в нашем клане ты не заскучаешь{.}
Text2 = {!}%main_color%Идёт набор в топовый клан. /warp fckcorp, в нашем клане нет скуки и безделия. У нас есть задания, ивенты, миссии, испытания и много чего ещё{!}
Text3 = {!}%main_color%Давно искал хороший клан но все не подошли{?} Предлагаю вступить в наш клан. {/}warp fckcorp
Text4 = {!}%main_color%Умеешь строить{?} А может быть хорош в пвп{?} Твои таланты не останутся незамеченными в нашем клане. {/}warp fckcorp
Text5 = {!}%main_color%Скитаешься по кланам? Время остановиться на нашем{!}) В нашем клане тебе точно понравится. {/}warp fckcorp
Text6 = {!}%main_color%Любишь масштабные и красивые постройки{?} Хорошо строишь? Тогда тебе к нам в клан. {/}warp fckcorp
Text7 = {!}%main_color%Открыт набор в клан FCKCORP. /warp fckcorp, у нас в клане вы найдёте: интересные задания, миссии, ивенты, собрания, тренировки и много чего интересного!
text = [Texts]`ntext1=%text1%`ntext2=%text2%`ntext3=%text3%`ntext4=%text4%`ntext5=%text5%`ntext6=%text6%`ntext7=%text7%`ntext_Custom=%text_custom%`n`nЗадержка перед сообщением(указывается в мс, 1 секунда = 1000мс)`n`n[Cooldown]`ncooldown=30000`ncooldown spam=500`n`n`n[Color]`ndark_red=&4&l`nred=&c&l`ngold=&6&l`nyellow=&e&l`ndark_green=&2&l`ngreen=&a&l`naqua=&b&l`ndark_aqua=&3&l`ndark_blue=&1&l`nblue=&9&l`nlight_purple=&d&l`ndark_purple=&5&l`nwhite=&f&l`ngray=&7&l`ndark_gray=&8&l`nblack=&0&l`n`n[Version]`nversion=%version_zag%


SetWorkingDir, %A_ScriptDir%
SendMessage, 0x50,, 0x4190419,, A
filename = %A_ScriptDir%/main/config.ini
IniRead, varcheck, main/config.ini, Cooldown, cooldown

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Read config///Read config///Read config///Read config///Read config///Read config///Read config///Read config/
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(varcheck > 0) {
IniRead, text_settings_1, main/config.ini, Texts, text1
IniRead, text_settings_2, main/config.ini, Texts, text2
IniRead, text_settings_3, main/config.ini, Texts, text3
IniRead, text_settings_4, main/config.ini, Texts, text4
IniRead, text_settings_5, main/config.ini, Texts, text5
IniRead, text_settings_6, main/config.ini, Texts, text6
IniRead, text_settings_7, main/config.ini, Texts, text7
IniRead, text_settings_custom, main/config.ini, Texts, text_custom
IniRead, cooldown, main/config.ini, Cooldown, cooldown
IniRead, cooldown_spam, main/config.ini, Cooldown, cooldown spam
Iniread, version, main/config.ini, Version, version
Iniread, dark_red_cfg, main/config.ini, Color, dark_red
Iniread, red_cfg, main/config.ini, Color, red
Iniread, gold_cfg, main/config.ini, Color, gold
Iniread, yellow_cfg, main/config.ini, Color, yellow
Iniread, dark_green_cfg, main/config.ini, Color, dark_green
Iniread, green_cfg, main/config.ini, Color, green
Iniread, aqua_cfg, main/config.ini, Color, aqua
Iniread, dark_aqua_cfg, main/config.ini, Color, dark_aqua
Iniread, dark_blue_cfg, main/config.ini, Color, dark_blue
Iniread, blue_cfg, main/config.ini, Color, blue
Iniread, light_purple_cfg, main/config.ini, Color, light_purple
Iniread, dark_purple_cfg, main/config.ini, Color, dark_purple
Iniread, white_cfg, main/config.ini, Color, white
Iniread, gray_cfg, main/config.ini, Color, gray
Iniread, dark_gray_cfg, main/config.ini, Color, dark_gray
Iniread, black_cfg, main/config.ini, Color, black
}
If(dark_red_cfg not ="&4") {
FileDelete, %filename%
FileCreateDir, main
FileAppend, %text%, %filename%,
}

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
Gui, Font, S12
Gui, Add, DropDownList, gAction vChoice x2 y9 w230 h120, Без цвета|Рандом|Тёмно красный|Красный|Золотой|Жёлтый|Тёмно зелёный|Зелёный|Голубой|Тёмно голубой|Тёмно синий|Синий|Розовый|Фиолетовый|Белый|Светло серый|Тёмно серый|Чёрный
Gui, Add, Radio, cWhite x2 y49 w200 h35 vRadioGroup gCheck ,Spam Random(В разработке)
Gui, Add, Radio, cWhite x2 y89 w220 h35 vRadioGroup2 gCheck ,Random(Рекомендуется)
Gui, Add, button, x2 120 w220 h35, Проверить_конфиг
Gui, Add, Text,cWhite x240 y7, Описание скрипта:
Gui, Add, Text,white, Остановить:
Gui, Add, Text,cWhite, alt+F9 или /stop
Gui, Add, Text,cWhite, Возобновить:
Gui, Add, Text,cWhite, alt+F10 или /resume
Gui, Add, Text,cWhite, Запустить /start
Gui, Add, Text,cWhite, Меню - insert
Gui, Add, Link,, <a href="https://discord.gg/gUd2dSaKaq">Наш Discord</a>
Gui, color, black
Gui, Show, w397 h325, AutoNabor V%version%



return
GuiClose: 
ExitApp
ButtonПроверить_конфиг:
msgbox, [Texts]`n%text_settings_1%`n`n%text_settings_2%`n`n%text_settings_3%`n`n%text_settings_4%`n`n%text_settings_5%`n`n%text_settings_6%`n`n%text_settings_7%`n`n%text_settings_custom%`n`n[Cooldown]`n%cooldown%`n%cooldown_spam%`n`n[Version]`nversion=%version%
return
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check//////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////


Check:
GuiControlGet, RadioGroup
if (RadioGroup = 1){
MsgBox, RadioGroup = %RadioGroup%
Gui, show
Rnd = false
}
GuiControlGet, RadioGroup2
if (RadioGroup2 = 1){
Gui, show
Rnd = true
}
Action:
;Использует текст взятый из конфига
Gui, Submit

If (Choice = "Без цвета") {
	Gui, show
	}
	If (Choice = "Рандом") {
		Gui, show
		loop {
		Random, choice_random, 1,16
		sleep 500
			If (choice_random = "1") {
			main_color = %dark_red_cfg%
			}
				If (choice_random = "2") {
				main_color = %red_cfg%
				}
					If (choice_random = "3") {
					main_color = %gold_cfg%
					}
						If (choice_random = "4") {
						main_color = %yellow_cfg%
						}
							If (choice_random = "5") {
							main_color = %dark_green_cfg%
							}
								If (choice_random = "6") {
								main_color = %green_cfg%
								}
									If (choice_random = "7") {
									main_color = %aqua_cfg%
									}
										If (choice_random = "8") {
										main_color = %dark_aqua_cfg%
										}
											If (choice_random = "9") {
											main_color = %dark_blue_cfg%
											}
													If (choice_random = "10") {
													main_color = %blue_cfg%
													}
														If (choice_random = "11") {
														main_color = %light_purple_cfg%
														}
															If (choice_random = "12") {
															main_color = %dark_purple_cfg%
															}
																If (choice_random = "13") {
																main_color = %white_cfg%
																}
																	If (choice_random = "14") {
																	main_color = %gray_cfg%
																	}
																		If (choice_random = "15") {
																		main_color = %dark_gray_cfg%
																		}
																			If (choice_random = "16") {
																			main_color = %black_cfg%
																		}}
		}
		If (Choice = "Тёмно красный") {
			main_color = %dark_red_cfg%
			Gui, show
			}
				If (Choice = "Красный") {
				main_color = %red_cfg%
				Gui, show
				}
					If (Choice = "Золотой") {
					main_color = %gold_cfg%
					Gui, show
					}
						If (Choice = "Жёлтый") {
						main_color = %yellow_cfg%
						Gui, show
						}
							If (Choice = "Тёмно зелёный") {
							main_color = %dark_green_cfg%
							Gui, show
							}
								If (Choice = "Зелёный") {
								main_color = %green_cfg%
								Gui, show
								}
									If (Choice = "Голубой") {
									main_color = %aqua_cfg%
									Gui, show
									}
										If (Choice = "Тёмно голубой") {
										main_color = %dark_aqua_cfg%
										Gui, show
										}
											If (Choice = "Тёмно синий") {
											main_color = %dark_blue_cfg%
											Gui, show
											}
													If (Choice = "Синий") {
													main_color = %blue_cfg%
													Gui, show
													}
														If (Choice = "Розовый") {
														main_color = %light_purple_cfg%
														Gui, show
														}
															If (Choice = "Фиолетовый") {
															main_color = %dark_purple_cfg%
															Gui, show
															}
																If (Choice = "Белый") {
																main_color = %white_cfg%
																Gui, show
																}
																	If (Choice = "Светло серый") {
																	main_color = %gray_cfg%
																	Gui, show
																	}
																		If (Choice = "Тёмно серый") {
																		main_color = %dark_gray_cfg%
																		Gui, show
																		}
																			If (Choice = "Чёрный") {
																			main_color = %black_cfg%
																			Gui, show
																		}
return	
ButtonStart:
return
;//////\\\
;Спам будет добавлен в следующих обновлениях.
																																		
Insert::
Gui, Show
return																																	
																																
:?:/start::
WinGetActiveTitle, Title																			
WinGet, minecraftPid, PID, %Title%
SendMessage, 0x50,, 0x4190419,, A
SetKeyDelay, 50, 50
sleep, 500
	ControlSend,, {blind}{esc}, ahk_pid %minecraftPID%
loop {
Random, rndch, 1,8
sleep, 1000
	If (rndch = "1") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																										
		ControlSend,, %main_color%%text_settings_1%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "2") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																													
		ControlSend,, %main_color%%text_settings_2%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "3") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																											
		ControlSend,, %main_color%%text_settings_3%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "4") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																												
		ControlSend,, %main_color%%text_settings_4%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "5") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_5%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "6") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																					
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_6%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "7") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%														
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_7%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If(text_settings_custom > 0) {
		If (rndch = "8") {
			SendMessage, 0x50,, 0x4190419,, A
		ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																					
			Sleep 200 ;																												
			ControlSend,, %main_color%%text_settings_custom%{enter}, ahk_pid %minecraftPID%
			sleep, %cooldown%
			}
		}
	}
return

:?:/stop::
!F9::
  If not Stop
  {
    Stop := True
    Pause
  }
Return
:?:/resume::
!F10::
  If Stop
  {
    Stop := False
    Pause
  }
Return
