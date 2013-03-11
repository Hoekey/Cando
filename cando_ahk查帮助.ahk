/*
说明：如果是有独立的页面，则直接指向独立页面
否则，就是搜索
*/
Cando_脚本文字_查帮助:

;自定义部分
	Ahk帮助路径=Z:\Kini\Dev\Ahk\[Sks_Autohotkey]\帮助与工具\AutoHotkey中文帮助.chm
	Ahk帮助标题=AutoHotkey 中文帮助
	Ahk关键字表=Block;BlockInput;Break;Catch;Click;ClipWait;ComObjActive;ComObjArray;ComObjConnect;ComObjCreate;ComObjError;ComObjFlags;ComObjGet;ComObjQuery;ComObjType;ComObjValue;Continue;Control;ControlClick;ControlFocus;ControlGet;ControlGetFocus;ControlGetPos;ControlGetText;ControlMove;ControlSend;ControlSetText;CoordMode;Critical;DetectHiddenText;DetectHiddenWindows;DllCall;Drive;DriveGet;DriveSpaceFree;Edit;Else;EnvAdd;EnvDiv;EnvGet;EnvMult;EnvSet;EnvSub;EnvUpdate;Exit;ExitApp;FileAppend;FileCopy;FileCopyDir;FileCreateDir;FileCreateShortcut;FileDelete;FileEncoding;FileGetAttrib;FileGetShortcut;FileGetSize;FileGetTime;FileGetVersion;FileInstall;FileMove;FileMoveDir;FileOpen;FileRead;FileReadLine;FileRecycle;FileRecycleEmpty;FileRemoveDir;FileSelectFile;FileSelectFolder;FileSetAttrib;FileSetTime;For;FormatTime;GetKeyState;Gosub;Goto;GroupActivate;GroupAdd;GroupClose;GroupDeactivate;Gui;GuiControl;GuiControlGet;GuiControls;Hotkey;IfBetween;IfEqual;IfExist;IfExpression;IfIn;IfInString;IfIs;IfMsgBox;IfWinActive;IfWinExist;ImageSearch;index;IniDelete;IniRead;IniWrite;Input;InputBox;KeyHistory;KeyWait;ListHotkeys;ListLines;ListVars;ListView;Loop;LoopFile;LoopParse;LoopReadFile;LoopReg;Menu;MouseClick;MouseClickDrag;MouseGetPos;MouseMove;MsgBox;ObjAddRef;OnExit;OnMessage;OutputDebug;Pause;PixelGetColor;PixelSearch;PostMessage;Process;Progress;Random;RegDelete;RegExMatch;RegExReplace;RegisterCallback;RegRead;RegWrite;Reload;Return;Run;RunAs;Send;SendLevel;SendMode;SetBatchLines;SetControlDelay;SetDefaultMouseSpeed;SetEnv;SetExpression;SetFormat;SetKeyDelay;SetMouseDelay;SetNumScrollCapsLockState;SetRegView;SetStoreCapslockMode;SetTimer;SetTitleMatchMode;SetWinDelay;SetWorkingDir;Shutdown;Sleep;Sort;SoundBeep;SoundGet;SoundGetWaveVolume;SoundPlay;SoundSet;SoundSetWaveVolume;SplashTextOn;SplitPath;StatusBarGetText;StatusBarWait;StringCaseSense;StringGetPos;StringLeft;StringLen;StringLower;StringMid;StringReplace;StringSplit;StringTrimLeft;StrPutGet;Suspend;SysGet;Thread;Throw;ToolTip;Transform;TrayTip;TreeView;Trim;Try;Until;URLDownloadToFile;VarSetCapacity;While;WinActivate;WinActivateBottom;WinClose;WinGet;WinGetActiveStats;WinGetActiveTitle;WinGetClass;WinGetPos;WinGetText;WinGetTitle;WinHide;WinKill;WinMaximize;WinMenuSelectItem;WinMinimize;WinMinimizeAll;WinMove;WinRestore;WinSet;WinSetTitle;WinShow;WinWait;WinWaitActive;WinWaitClose;#AllowSameLineComments;#ClipboardTimeout;#CommentFlag;#ErrorStdOut;#EscapeChar;#HotkeyInterval;#HotkeyModifierTimeout;#Hotstring;#If;#IfTimeout;#IfWinActive;#Include;#InputLevel;#InstallKeybdHook;#InstallMouseHook;#KeyHistory;#MaxHotkeysPerInterval;#MaxMem;#MaxThreads;#MaxThreadsBuffer;#MaxThreadsPerHotkey;#MenuMaskKey;#NoEnv;#NoTrayIcon;#Persistent;#SingleInstance;#UseHook;#Warn;#WinActivateForce
	Ahk被查关键字=(^|;)%CandySelected%($|;)

;是否已经运行
	IfWinNotExist,%Ahk帮助标题%
	{
		Run, %Ahk帮助路径%
		WinWait,%Ahk帮助标题%,,1
	}
	WinActivate,%Ahk帮助标题%

;有doc可打开
	if RegExMatch(Ahk关键字表,Ahk被查关键字)
	{
		ProperClick("SysTabControl321")
		SendMessage 0x130C,0,, SysTabControl321,%Ahk帮助标题%
		ProperClick("SysTabControl321")
		Sleep,100
		StringReplace,直接打开,CandySelected,#,_
		Ahk跳转的地址=/docs/commands/%直接打开%.htm
		Send !gu
		Loop 3
			IfWinNotActive Ahk_Class #32770  ; Is it still searching?
				Sleep 100
		IfWinActive Ahk_Class #32770  ; Error dialog
		{
			ControlSetText,edit1,%Ahk跳转的地址%
			sleep,10
			send,{enter}
		}
	}
;没有则搜索
	Else
	{
		SendMessage 0x130C, 2,, SysTabControl321,%Ahk帮助标题%
		ControlSetText,edit1,%CandySelected%,%Ahk帮助标题%
		ProperClick("SysTabControl321")
		Sleep,100
		SendMessage 0x130B,,, SysTabControl321  ; 0x130B = TCM_GETCURSEL. Which tabpage Is Selected? Answer Is ErrorLevel
		ProperClick("Button2")  ; Start searching
		Sleep 100  ; Waiting to finish searching
		Loop 3
			IfWinActive Ahk_Class #32770  ; Is it still searching?
				Sleep 100
		IfWinActive Ahk_Class #32770  ; Error dialog
			WinClose  ; Close dialog, it Is an Error
		Else
			ProperClick("Button3")  ; Show First page In the List
	}
	Return
	;-----------------------------------------------------------------------------------------------------------------
	ProperClick(ControlName)
	{
		BlockInput MouseMove  ; Disable Mouse movement to prevent user interaction
		ControlClick %ControlName%, Ahk_Class HH Parent, , , , NA  ; Perform the Click (NA Is required!)
		BlockInput MouseMoveOff  ; Enable Mouse movement
	}
