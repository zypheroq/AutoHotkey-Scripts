#Persistent
SetTitleMatchMode, 2  ; Allows matching partial window titles

; Define the RGB range for the orange text
colorMin := 0xC88058  ; Lighter orange
colorMax := 0xE0946D  ; Darker orange

; Define the area to search around the center of the screen
centerX := A_ScreenWidth / 2
centerY := A_ScreenHeight / 2
searchRadius := A_ScreenWidth * 2 / 3 / 2  ; Two-thirds of the screen width, divided by 2

; Variables to store the last found position
lastX := centerX
lastY := centerY

; Flag to indicate whether the script is running
isRunning := false

; Hotkey to toggle the script (Alt + C)
!c::
    isRunning := !isRunning  ; Toggle the running state
    if (isRunning)
    {
        ; Start the loop with a faster timer
        SetTimer, ClickLoop, 10  ; Check every 10 milliseconds
    }
    else
    {
        ; Stop the loop
        SetTimer, ClickLoop, Off
    }
return

ClickLoop:
    ; Calculate the search area boundaries
    x1 := centerX - searchRadius
    y1 := centerY - searchRadius
    x2 := centerX + searchRadius
    y2 := centerY + searchRadius

    ; Search for colors between the defined range
    PixelSearch, xPos, yPos, x1, y1, x2, y2, colorMin, 40, Fast RGB
    
    ; If colorMin is not found, search for the darker color
    if (ErrorLevel)
    {
        PixelSearch, xPos, yPos, x1, y1, x2, y2, colorMax, 40, Fast RGB
    }

    if (!ErrorLevel) ; If any of the colors are found
    {
        ; Update the last found position
        lastX := xPos
        lastY := yPos
        ; Display found position
        ToolTip, Found color at %xPos%, %yPos%
    }
    else
    {
        ; Display last known position if no color found
        ToolTip, No color found. Clicking at last known position: %lastX%, %lastY%
    }

    ; Click at the last known position
    MouseMove, lastX, lastY, 0
    Click

    ; Hide the tooltip after clicking
    Sleep, 50  ; Shorter delay to make updates faster
    ToolTip
return
