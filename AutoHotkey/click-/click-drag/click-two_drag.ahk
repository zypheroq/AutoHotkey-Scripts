; Declare variables
mx := 0
my := 0
mx2 := 0
my2 := 0
dragging := false  ; Flag to toggle the dragging state

; Alt+1 to capture the first set of mouse coordinates
!1::
    MouseGetPos, mx, my
    ToolTip, First position set at %mx%, %my%  ; Corrected: no parentheses around variables
    Sleep, 1000
    ToolTip
return

; Alt+2 to capture the second set of mouse coordinates
!2::
    MouseGetPos, mx2, my2
    ToolTip, Second position set at %mx2%, %my2%  ; Corrected: no parentheses around variables
    Sleep, 1000
    ToolTip
return

; Alt+S to toggle the drag loop
!s::
    dragging := !dragging  ; Toggle the dragging flag
    if (dragging)  ; If dragging is enabled
    {
        SetTimer, StartDrag, 10  ; Start the dragging loop with a timer interval
        ToolTip, Dragging started
    }
    else  ; If dragging is disabled
    {
        SetTimer, StartDrag, Off  ; Stop the dragging loop
        ToolTip, Dragging stopped
    }
    Sleep, 1000
    ToolTip
return

; Dragging function
StartDrag:
    MouseClickDrag, L, %mx%, %my%, %mx2%, %my2%
return
