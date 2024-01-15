extends Node

#system attributes
var snakeX = 0
var stutteredSnakePositionPrintModulo: float = 0
const stutteredSnakePositionPrintModuloQuantity: float = 3
const doStutterdSnakePrint: bool = true

#local mechanism attributes
const snakeSpeed = 5.2
const userTurnMarginDelta = 14

func main():
	#extendingClasses0()
	#testingFloats0()
	#testingErrorMessagePrints()
	Main.localSystemError("Warning: using an unstable snake turning mechanism.")
	pass

func _process(delta):
	movingSnakeTickMain(delta)
	pass
	
	
func movingSnakeTickMain(delta):
	movingSnakeTick1_unstable_by_user_defined(delta)
	if doStutterdSnakePrint == false:
		print("snakeX: " + str(snakeX))
	if doStutterdSnakePrint == true:
		if stutteredSnakePositionPrintModulo > stutteredSnakePositionPrintModuloQuantity:
			stutteredSnakePositionPrintModulo = 0
			print("snakeX: " + str(snakeX))

func movingSnakeTick1_unstable_by_user_defined(delta):
	var deltaIncrementation = delta * snakeSpeed
	snakeX += deltaIncrementation
	stutteredSnakePositionPrintModulo += deltaIncrementation

func movingSnakeTick0(delta):
	snakeX += delta

#classes test:
class Animal:
	func animalSound():
		print("I'm an animal you fricking stupid. I don't have a sound.")
		

class Pig extends Animal:
	var name
	
	func _init(_name):
		self.name = _name

func extendingClasses0():
	var pig: Pig = Pig.new("Albert")
	pig.animalSound()
	#works.

func testingErrorMessagePrints():
	var errorMsg = "did not work."
	Main.localSystemError(errorMsg)
	#push_warning(errorMsg)
	#push_error(errorMsg)		#the red text is better for this so this method works better for my purposes.

func testingFloats0():
	if 3.3 > 3.299:
		print("yes 3.3 is bigger than 3.299")
	if 3.3 < 3.299:
		print("Output: true. Error: expected false.")
