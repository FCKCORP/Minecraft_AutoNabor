;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI///GUI////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
Gui, Font, S12
Gui, Add, DropDownList, gAction vChoice x2 y9 w230 h120, Временно не работает|Вариация текста 1|Вариация текста 2|Вариация текста 3|Вариация текста 4|Вариация текста 5|Вариация текста 6|Вариация текста 7|Кастомная вариация текста
Gui, Add, Radio, x2 y49 w200 h35 vRadioGroup gCheck ,Palevo(В разработке)
Gui, Add, Radio, x2 y89 w220 h35 vRadioGroup2 gCheck ,Random(Рекомендуется)
Gui, Add, button, x2 120 w220 h35, Проверить_конфиг
Gui, Add, Text, x240 y7, Описание скрипта:
Gui, Add, Text,, Остановить:
Gui, Add, Text,, alt+F9 или /stop
Gui, Add, Text,, Возобновить:
Gui, Add, Text,, alt+F10 или /resume
Gui, Add, Text,, Запустить /start
Gui, Add, Text,, Меню - insert
Gui, Add, Link,, <a href="https://discord.gg/gUd2dSaKaq">Наш Discord</a>
Gui, Show, w397 h325, AutoNabor V1.1


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Variables///Variables///Variables///Variables///Variables///Variables///Variables///Variables///Variables/////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Text1 = {!}&f&lНадоели скучные кланы{?} Пропадает интерес к игре{?} Тогда тебе к нам в клан{!} {/}warp fckcorp, в нашем клане ты не заскучаешь{.}
Text2 = {!}&f&lИдёт набор в топовый клан. /warp fckcorp, в нашем клане нет скуки и безделия. У нас есть задания, ивенты, миссии, испытания и много чего ещё{!}
Text3 = {!}&f&lДавно искал хороший клан но все не подошли{?} Предлагаю вступить в наш клан. {/}warp fckcorp
Text4 = {!}&f&lУмеешь строить{?} А может быть хорош в пвп{?} Твои таланты не останутся незамеченными в нашем клане. {/}warp fckcorp
Text5 = {!}&f&lСкитаешься по кланам? Время остановиться на нашем{!}) В нашем клане тебе точно понравится. {/}warp fckcorp
Text6 = {!}&f&lЛюбишь масштабные и красивые постройки{?} Хорошо строишь? Тогда тебе к нам в клан. {/}warp fckcorp
Text7 = {!}&f&lОткрыт набор в клан FCKCORP. /warp fckcorp, у нас в клане вы найдёте: интересные задания, миссии, ивенты, собрания, тренировки и много чего интересного!
text = [Texts]`ntext1=%text1%`ntext2=%text2%`ntext3=%text3%`ntext4=%text4%`ntext5=%text5%`ntext6=%text6%`ntext7=%text7%`ntext_Custom=%text_custom%`n`nЗадержка перед сообщением(указывается в мс, 1 секунда = 1000мс)`n`n[Cooldown]`ncooldown=30000

SetWorkingDir, %A_ScriptDir%
SendMessage, 0x50,, 0x4190419,, A
filename = %A_ScriptDir%/main/config.ini
FileReadLine, varcheck, %filename%, 2

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
}
If(varcheck <> 0) {
FileDelete, %filename%
FileCreateDir, main
FileAppend, %text%, %filename%,
}

return
GuiClose: 
ExitApp
ButtonПроверить_конфиг:
msgbox, [Texts]`n%text_settings_1%`n`n%text_settings_2%`n`n%text_settings_3%`n`n%text_settings_4%`n`n%text_settings_5%`n`n%text_settings_6%`n`n%text_settings_7%`n`n%text_settings_custom%`n`n[Cooldown]`n%cooldown%`n
return
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check///Check//////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////


Check:
GuiControlGet, RadioGroup
if (RadioGroup = 1){
MsgBox, RadioGroup = %RadioGroup%
Rnd = false
}
else {
Rnd = true	
}
GuiControlGet, RadioGroup2
if (RadioGroup2 = 1){
MsgBox, Выбран Random.`nЗайдите в майнкрафт и напишите /start
Rnd = true
}
else {
Rnd = false	
}
Action:
;Использует текст взятый из конфига
Gui, Submit
		If (Choice = "Вариация текста 1") {
			MsgBox, Вы выбрали текст `n`n%text_settings_1%
			}
				If (Choice = "Вариация текста 2") {
					MsgBox, Вы выбрали текст `n`n%text_settings_2%
				}
					If (Choice = "Вариация текста 3") {
						MsgBox, Вы выбрали текст `n`n%text_settings_3%
					}
						If (Choice = "Вариация текста 4") {
							MsgBox, Вы выбрали текст `n`n%text_settings_4%
						}
							If (Choice = "Вариация текста 5") {
								MsgBox, Вы выбрали текст `n`n%text_settings_5%
							}
								If (Choice = "Вариация текста 6") {
									MsgBox, Вы выбрали текст `n`n%text_settings_6%
								}
									If (Choice = "Вариация текста 7") {
										MsgBox, Вы выбрали текст `n`n%text_settings_7%
									}
										If (Choice = "Кастомная вариация текста") {
											MsgBox, Кастомная вариация текста`n`n%text_settings_custom%`n`n 256 Символов максимум(с учётом "!" 255 символов на текст.)
										}
return
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
; Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject     |||
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
																																		;//////||/
Delete::																																;//////|/
																																		;///////
WinGetActiveTitle, Title																												;//////
msgbox, Injected on %Title%																												;//////
WinGet, minecraftPid, PID, %Title%																										;//////\
return																																	;//////\\
																																		;//////\\\
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
; Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam  |||
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
; Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject ///Inject     |||
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
																																		
Insert::
Gui, Show
return																																	
																																		
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
; Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam /// Spam  |||
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////|||
If(Rnd = true) {
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
		Sleep 140 ;																										
		ControlSend,, %text_settings_1%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "2") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																				
		Sleep 140 ;																													
		ControlSend,, %text_settings_2%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "3") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																	
		Sleep 140 ;																											
		ControlSend,, %text_settings_3%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "4") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																	
		Sleep 140 ;																												
		ControlSend,, %text_settings_4%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "5") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																				
		Sleep 140 ;																														
		ControlSend,, %text_settings_5%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "6") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																					
		Sleep 140 ;																														
		ControlSend,, %text_settings_6%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If (rndch = "7") {
		SendMessage, 0x50,, 0x4190419,, A
	ControlSend,, {blind}{t}, ahk_pid %minecraftPID%														
		Sleep 140 ;																														
		ControlSend,, %text_settings_7%{enter}, ahk_pid %minecraftPID%
		sleep, %cooldown%
	}
	If(text_settings_custom > 0) {
		If (rndch = "8") {
			SendMessage, 0x50,, 0x4190419,, A
		ControlSend,, {blind}{t}, ahk_pid %minecraftPID%																					
			Sleep 140 ;																												
			ControlSend,, %text_settings_custom%{enter}, ahk_pid %minecraftPID%
			sleep, %cooldown%
			}
		}
	}
return
}
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








