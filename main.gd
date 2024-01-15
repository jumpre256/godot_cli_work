extends Node

var ticks = 0
const startTimeoutCLI = 0.9
const cliExit: bool = false

func _ready():
	forRastaSnake.main()
	#pass

func _process(delta):
	ticks += delta
	#print(ticks)
	if ticks > startTimeoutCLI and cliExit:
		get_tree().quit()

func localSystemError(msg):
	printerr(msg)
	#printerr("Error: " + msg)
	###push_error(msg)
