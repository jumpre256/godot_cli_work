extends Node

var ticks = 0
const startTimeout = 0.9

func _ready():
	print("hello world.")

func _process(delta):
	ticks += delta
	#print(ticks)
	if ticks > startTimeout:
		get_tree().quit()
