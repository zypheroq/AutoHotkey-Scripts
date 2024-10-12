!s::
MouseGetPos xpos, ypos 
	Mx := xpos
	My := ypos
		My += 10
Click %Mx% %My% 0

	return

!w::
MouseGetPos xpos, ypos 
	Mx := xpos
	My := ypos
		My -= 10
Click %Mx% %My% 0

	return

!a::
MouseGetPos xpos, ypos 
	Mx := xpos
	My := ypos
		Mx -= 10
Click %Mx% %My% 0

	return

!d::
MouseGetPos xpos, ypos 
	Mx := xpos
	My := ypos
		Mx += 10
Click %Mx% %My% 0

	return