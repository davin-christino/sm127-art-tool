class_name LavaAttributes extends Resource
## Provides the properties each lava object should have in lava art.

## Enum for tap mode.
enum TapMode {
	## Scales the height of the lava with a crystal tap.
	SCALE = 0,
	## Moves the lava with a crystal tap.
	MOVE = 1, 
}

## Enables the lava's functionality.
@export var enabled: bool = true
## Makes the object visible. (Why would you want to disable this?)
@export var visible: bool = true
## Renders the object in front of terrain.
@export var render_in_front: bool = false
## The tag referenced by crystal taps.
@export var tag := "default"
## Determines the lava object's behaviour with crystal taps.
@export var tap_mode: TapMode
