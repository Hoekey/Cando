Cando_文件列表:
   ; dateCut := A_Now
   ; EnvAdd, dateCut, -1, days       ; sets a date -24 hours from now
   列表产生的文件=%A_Temp%\万年书妖文件列表临时文件_%A_now%.txt
;    MsgBox %CandySelected%
   loop, %CandySelected%\*.*, 1, 1   ; change the folder name
   {
   ;    if (A_LoopFileTimeModified >= dateCut)
         str .= A_LoopFileFullPath "`n"
   }
   FileAppend,%str%,%列表产生的文件%
;    Sleep,50
   Run,%程序路径_默认文本编辑器% %列表产生的文件%
   Return