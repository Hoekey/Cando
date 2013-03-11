cando_变大写:
 StringUpper Clipboard, candyselected
 Send ^v
RETURN

cando_变小写:
 StringLower Clipboard, candyselected
 Send ^v
RETURN

cando_首字大写:
 StringUpper Clipboard, candyselected, T
 Send ^v
RETURN

cando_大小颠倒:
 Lab_Invert_Char_Out:= ""
 Loop % Strlen(candyselected) {
    Lab_Invert_Char:= Substr(candyselected, A_Index, 1)
    if Lab_Invert_Char is upper
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) + 32)
    else if Lab_Invert_Char is lower
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) - 32)
    else
       Lab_Invert_Char_Out:= Lab_Invert_Char_Out Lab_Invert_Char
 }
 clipboard=%Lab_Invert_Char_Out%
 send ^v
RETURN

cando_句子模式:
StringLower, Clipboard, candyselected
Clipboard := RegExReplace(Clipboard, "((?:^|[.!?]\s+)[a-z])", "$u1")
Send ^v
RETURN