#Persistent  ; Keep the script running

; Variables to store mouse positions
MX1 := 0
MY1 := 0
MX2 := 0
MY2 := 0

; Variable to control the clicking loop
isClicking := false

; Hotkey to store first mouse position (Alt + 1)
!1::
    MouseGetPos, MX1, MY1
    ToolTip, First position saved:`nX1: %MX1%`nY1: %MY1%
    Sleep, 1000
    ToolTip
return

; Hotkey to store second mouse position (Alt + 2)
!2::
    MouseGetPos, MX2, MY2
    ToolTip, Second position saved:`nX2: %MX2%`nY2: %MY2%
    Sleep, 1000
    ToolTip
return

; Hotkey to toggle clicking (Alt + S)
!s::
    isClicking := !isClicking  ; Toggle clicking state
    if (isClicking) {
        ToolTip, Clicking started!
        SetTimer, ClickLoop, 100  ; Adjust the speed of clicks (100 ms)
    } else {
        ToolTip, Clicking stopped!
        SetTimer, ClickLoop, Off
    }
    Sleep, 1000
    ToolTip
return

; Function to perform the clicking loop
ClickLoop:
    Click, %MX1%, %MY1%, right
    Sleep, 50  ; Pause between clicks (50 ms)
    Click, %MX2%, %MY2%, right
return
