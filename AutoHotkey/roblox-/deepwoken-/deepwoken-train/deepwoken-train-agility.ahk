; Initialize a variable to keep track of the loop state
toggle := false

; Define the hotkey Alt + A
!a::
    ; If the loop is active, stop it and release 'w'
    if (toggle) {
        SetTimer, LoopAction, Off
        Send, {w up}
        ; Ensure 'w' is released before processing any further input
        Sleep, 100
    } else {
        ; Ensure 'w' is not already pressed
        if (!GetKeyState("w", "P")) {
            Send, {w down}
        }
        SetTimer, LoopAction, 50  ; Start the loop with 50 ms interval
    }

    ; Toggle the state (true/false)
    toggle := !toggle
return

; Define the loop action
LoopAction:
    Send, q
return
