cando_ahk����:
;-------------------------------------------------------------------------------
#SingleInstance Force
SetTitleMatchMode RegEx
;_______________________________________________________________________________
;������ļ���·��
FilePath_AHK := "D:\installed\ahk����\AutoHotkey.chm"
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
  
  	ToolTip,���ող�ѯ�ˣ�%function%
    sleep 2000
    tooltip
}


Return

