extends Node

var ticks = 0
const startTimeoutCLI = 0.9
const cliExit: bool = false

func _ready():
	#forRastaSnake0.main()
	forRastaSnake1.main()
	pass

func _process(delta):
	ticks += delta
	#print(ticks)
	if ticks > startTimeoutCLI and cliExit:
		get_tree().quit()

func floatModulo(value: float, divider: float) -> float:
	
	var returnEntity: float = value
	while(returnEntity >= 0):	#while !(returnEntity < 0):
		
		returnEntity -= divider
		
	return returnEntity + divider

func localSystemError(msg):
	printerr(msg)
	#printerr("Error: " + msg)
	###push_error(msg)
