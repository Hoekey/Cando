cando_ahk帮助:
;-------------------------------------------------------------------------------
#SingleInstance Force
SetTitleMatchMode RegEx
;_______________________________________________________________________________
;你帮助文件的路径
FilePath_AHK := "D:\installed\ahk环境\AutoHotkey.chm"
BaseURL_AHK  := "mk:@MSITStore:%FilePath_AHK%::/docs/commands/%function%.htm"
;_______________________________________________________________________________
Lang := "ahk"
sleep 500
  ; Trim spaces and launch the CHM
  Function = %Clipboard%
 ; tooltip %Function%
  ShowFunction( Function, Lang )

ShowFunction( function, lang="ahk" ) {
  Local ThisUrl
    ;function := RegexReplace( function, "\W", "_" ) ; For other helps
  Transform ThisUrl, DeRef, % BaseURL_%lang%
  Run hh.exe %ThisUrl%
  
  	ToolTip,您刚刚查询了：%function%
    sleep 2000
    tooltip
}


Return

