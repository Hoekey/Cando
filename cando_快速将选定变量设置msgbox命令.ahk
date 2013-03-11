cando_msgbox_selected:
;快速将选定变量设置msgbox命令
send {end}{enter}
send msgbox %A_space% `%%candyselected%`%
send {end}{enter}
return