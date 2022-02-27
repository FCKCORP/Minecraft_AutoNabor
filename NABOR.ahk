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

chat_open_zag = l
main_color_cfg = %white%
cooldown_zag = 30000
cooldown_spam_zag = 500
version_zag = 1.7

Text1 = {!}%main_color%Надоели скучные кланы{?} Пропадает интерес к игре{?} Тогда тебе к нам в клан{!} {/}warp fckcorp, в нашем клане ты не заскучаешь{.}
Text2 = {!}%main_color%Идёт набор в топовый клан. /warp fckcorp, в нашем клане нет скуки и безделия. У нас есть задания, ивенты, миссии, испытания и много чего ещё{!}
Text3 = {!}%main_color%Давно искал хороший клан но все не подошли{?} Предлагаю вступить в наш клан. {/}warp fckcorp
Text4 = {!}%main_color%Умеешь строить{?} А может быть хорош в пвп{?} Твои таланты не останутся незамеченными в нашем клане. {/}warp fckcorp
Text5 = {!}%main_color%Скитаешься по кланам? Время остановиться на нашем{!}) В нашем клане тебе точно понравится. {/}warp fckcorp
Text6 = {!}%main_color%Любишь масштабные и красивые постройки{?} Хорошо строишь? Тогда тебе к нам в клан. {/}warp fckcorp
Text7 = {!}%main_color%Открыт набор в клан FCKCORP. /warp fckcorp, у нас в клане вы найдёте: интересные задания, миссии, ивенты, собрания, тренировки и много чего интересного!


SetWorkingDir, %A_ScriptDir%
SendMessage, 0x50,, 0x4190419,, A
filename = %A_AppData%\FCKCORP\AutoNabor\config.ini
IniRead, varcheck, %filename%,CHECK,check 
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Read config///Read config///Read config///Read config///Read config///Read config///Read config///Read config/
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(varcheck = 3) {
IniRead, chat_open, %filename%, ChatOpen, button_open_chat
IniRead, text_settings_1, %filename%, Texts, text1
IniRead, text_settings_2, %filename%, Texts, text2
IniRead, text_settings_3, %filename%, Texts, text3
IniRead, text_settings_4, %filename%, Texts, text4
IniRead, text_settings_5, %filename%, Texts, text5
IniRead, text_settings_6, %filename%, Texts, text6
IniRead, text_settings_7, %filename%, text7
IniRead, text_settings_custom, %filename%, Texts, text_custom
IniRead, cooldown, %filename%, Cooldown, cooldown
IniRead, cooldown_spam, %filename%, Cooldown, cooldown spam
Iniread, version, %filename%, Version, version
Iniread, dark_red_cfg, %filename%, Color, dark_red
Iniread, red_cfg, %filename%, Color, red
Iniread, gold_cfg, %filename%, Color, gold
Iniread, yellow_cfg, %filename%, Color, yellow
Iniread, dark_green_cfg, %filename%, Color, dark_green
Iniread, green_cfg, %filename%, Color, green
Iniread, aqua_cfg, %filename%, Color, aqua
Iniread, dark_aqua_cfg, %filename%, Color, dark_aqua
Iniread, dark_blue_cfg, %filename%, Color, dark_blue
Iniread, blue_cfg, %filename%, Color, blue
Iniread, light_purple_cfg, %filename%, Color, light_purple
Iniread, dark_purple_cfg, %filename%, Color, dark_purple
Iniread, white_cfg, %filename%, Color, white
Iniread, gray_cfg, %filename%, Color, gray
Iniread, dark_gray_cfg, %filename%, Color, dark_gray
Iniread, black_cfg, %filename%, Color, black
}

If(varcheck not = 3) {
FileCreateDir, %A_AppData%\FCKCORP\AutoNabor
IniWrite, %chat_open_zag%, %filename%, ChatOpen, button_open_chat


IniWrite, %text1%, %filename%, Texts, text1
IniWrite, %text2%, %filename%, Texts, text2
IniWrite, %text3%, %filename%, Texts, text3
IniWrite, %text4%, %filename%, Texts, text4
IniWrite, %text5%, %filename%, Texts, text5
IniWrite, %text6%, %filename%, Texts, text6
IniWrite, %text7%, %filename%, Texts, text7
IniWrite, %text_custom%, %filename%, Texts, text_custom


IniWrite, %cooldown_zag%, %filename%,Cooldown, cooldown
IniWrite, %cooldown_spam_zag%, %filename%, Cooldown, cooldown spam
IniWrite, %dark_red%, %filename%, Color, dark_red
IniWrite, %red%, %filename%, Color, red
IniWrite, %gold%, %filename%, Color, gold
IniWrite, %yellow%, %filename%, Color, yellow
IniWrite, %dark_green%, %filename%, Color, dark_green
IniWrite, %green%, %filename%, Color, green
IniWrite, %aqua%, %filename%, Color, aqua
IniWrite, %dark_aqua%, %filename%, Color, dark_aqua
IniWrite, %dark_blue%, %filename%, Color, dark_blue
IniWrite, %blue%, %filename%, Color, blue
IniWrite, %light_purple%, %filename%, Color, light_purple
IniWrite, %dark_puple%, %filename%, Color, dark_purple
IniWrite, %white%, %filename%, Color, white
IniWrite, %gray%, %filename%, Color, gray
IniWrite, %dark_gray%, %filename%, Color, dark_gray
IniWrite, %black%, %filename%, Color, black

IniWrite, %version_zag%, %filename%, Version, version
IniWrite, 3, %filename%,CHECK,check 
}
time := cooldown//1000 ; Перевод мс в секунды

;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
Gui, Font, S12
Gui, Add, DropDownList, gAction vChoice x2 y9 w230 h120, Без цвета|Рандом|Тёмно красный|Красный|Золотой|Жёлтый|Тёмно зелёный|Зелёный|Голубой|Тёмно голубой|Тёмно синий|Синий|Розовый|Фиолетовый|Белый|Светло серый|Тёмно серый|Чёрный
Gui, Add, Text, cWhite x10 y49 w200 h35, Режимы работы скрипта
Gui, Add, Text, cWhite x10 y79 w230 h35, Отправка раз в %time% cекунд
Gui, Add, Text, cWhite x10 y109 w200 h35, Запуск - /start 
Gui,Add,Text, cRed x120 y109, [Работает]
Gui, Add, Text, cWhite x10 y139 w220 h35, Спам - /spam
Gui,Add,Text, cRed x120 y139, [Работает]
Gui, Add, button, x2 220 w220 h35, Проверить_конфиг
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
if(version not = version_zag)
{
	Iniread, version, %filename%, Version, version
	IniWrite, %version_zag%, %filename%, Version, version
	
	loop 2	{
		Reload
		sleep 1500
	}
}

return
GuiClose: 
ExitApp
ButtonПроверить_конфиг:
Run, %filename%
return
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check//////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
SetKeyDelay, 5, 5
sleep, 500
	ControlSend,, {blind}{esc}, ahk_pid %minecraftPID%
loop {
Random, rndch, 1,8
sleep, 1000
	If (rndch = "1") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																										
		ControlSend,, %main_color%%text_settings_1%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "2") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																													
		ControlSend,, %main_color%%text_settings_2%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "3") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																											
		ControlSend,, %main_color%%text_settings_3%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "4") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																												
		ControlSend,, %main_color%%text_settings_4%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "5") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_5%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "6") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																					
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_6%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "7") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%														
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_7%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If(text_settings_custom > 0) {
		If (rndch = "8") {
			SendMessage, 0x50,, 0x4190419,, A
		ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																					
			Sleep 200 ;																												
			ControlSend,, %main_color%%text_settings_custom%{enter}, ahk_pid %minecraftPID%
			sleep, %cooldown%
			}
		}
	}
return

;
;SPAM
;

:?:/spam::
WinGetActiveTitle, Title																			
WinGet, minecraftPid, PID, %Title%
SendMessage, 0x50,, 0x4190419,, A
SetKeyDelay, 5, 5
sleep, 500
	ControlSend,, {blind}{esc}, ahk_pid %minecraftPID%
loop {
Random, rndch, 1,8
sleep, 1000
	If (rndch = "1") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																										
		ControlSend,, %main_color%%text_settings_1%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "2") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																													
		ControlSend,, %main_color%%text_settings_2%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "3") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																											
		ControlSend,, %main_color%%text_settings_3%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "4") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																	
		Sleep 200 ;																												
		ControlSend,, %main_color%%text_settings_4%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "5") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																				
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_5%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "6") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																					
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_6%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If (rndch = "7") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%														
		Sleep 200 ;																														
		ControlSend,, %main_color%%text_settings_7%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown_spam%
	}
	If(text_settings_custom > 0) {
		If (rndch = "8") {
			SendMessage, 0x50,, 0x4190419,, A
		ControlSend,, {blind}{%chat_open%}, ahk_pid %minecraftPID%																					
			Sleep 200 ;																												
			ControlSend,, %main_color%%text_settings_custom%{enter}, ahk_pid %minecraftPID%
			sleep, %cooldown_spam%
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
