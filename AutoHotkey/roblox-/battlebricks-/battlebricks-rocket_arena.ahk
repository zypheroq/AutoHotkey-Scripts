#Persistent

; Flag to control the loop
global toggle := false

; Trigger key (Alt + B) to start/stop the loop
!b::
toggle := !toggle
if (toggle) {
    SetTimer, Send6, 6000      ; Every 6 seconds
    SetTimer, Send3, 3000      ; Every 3 seconds
    SetTimer, Send8, 21000     ; Every 21 seconds
    SetTimer, ClickFire, 5000 ; Every 5 seconds
    SetTimer, ClickReplay, 1000 ; Every 1 second
} else {
    SetTimer, Send6, Off
    SetTimer, Send3, Off
    SetTimer, Send8, Off
    SetTimer, ClickFire, Off
    SetTimer, ClickReplay, Off
}
return

; Every 6 seconds, send "6"
Send6:
Send, 6
return

; Every 3 seconds, send "3"
Send3:
Send, 3
return

; Every 21 seconds, send "8"
Send8:
Send, 8
return

; Every 5 seconds, click on the cannon button
ClickFire:
Click, 2235 1427
return

; Every 1 second, press replay, also buys sword battlers.
ClickReplay:
Click, 1082 1542
return
