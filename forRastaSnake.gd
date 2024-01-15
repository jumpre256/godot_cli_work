extends Node

var snakeX = 0

func main():
	testingFloats0()



func _process(delta):
	movingSnakeTickMain(delta)
	
	
func movingSnakeTickMain(delta):
	movingSnakeTick0(delta)
	print("snakeX: " + str(snakeX))

func movingSnakeTick0(delta):
	snakeX += delta

func testingFloats0():
	if 3.3 > 3.299:
		print("yes 3.3 is bigger than 3.299")
	if 3.3 < 3.299:
		print("Output: true. Error: expected false.")
