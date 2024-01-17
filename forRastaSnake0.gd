extends Node

#system attributes
var snakeX = 0
const squareWidth = 90
var doQuit: bool = false
var quitTicks = 0
var stutteredSnakePositionPrintModulo: float = 0
const stutteredSnakePositionPrintModuloQuantity: float = 86
const doStutterdSnakePrint: bool = true

#local mechanism attributes
var turnedThisLoop : bool = false
const snakeSpeed = 37.2
const userTurnMarginDelta = 14
var debugTurnableSpots = []

func main():
	#extendingClasses0()
	#testingFloats0()
	#testingErrorMessagePrints()
	Main.localSystemError("Warning: using an unstable snake turning mechanism.")
	pass

func _process(delta):
	movingSnakeTickMain(delta)
	if doQuit:
		quitTicks += 1
	if quitTicks > 0:
		_subprocess_quit()
	if Input.is_action_pressed("userProcessTermination"):
		print(debugTurnableSpots)
		doQuit = true
		#_subprocess_quit() #doing this doesn't seem to work.

	
	
func movingSnakeTickMain(delta):
	#movingSnakeTick1_unstable_by_user_defined(delta)
	movingSnakeTick2(delta)
	var turnable = canTurn0_unstable_by_user_defined() #has to go here in control flow due to the function's side-effects.
	if doStutterdSnakePrint == false:
		print("snakeX: " + str(snakeX))
	if doStutterdSnakePrint == true:
		if stutteredSnakePositionPrintModulo > stutteredSnakePositionPrintModuloQuantity:
			stutteredSnakePositionPrintModulo = 0
			var printMsg = "snakeX: " + str(snakeX) + " turnable: " + str(turnable)
			print(printMsg)


func canTurn0_unstable_by_user_defined() -> bool:
	var turnable = false
	var moduloResult = Main.floatModulo(snakeX, float(squareWidth))
	if moduloResult < userTurnMarginDelta and turnedThisLoop == false:
		turnedThisLoop = true
		turnable = true
		var printMsg = "Can turn! snakeX: " + str(snakeX)
		print(printMsg)
		debugTurnableSpots.push_back(printMsg)
	
	if moduloResult > userTurnMarginDelta and turnedThisLoop == true:
		turnedThisLoop = false
		turnable = false
	
	return turnable

func movingSnakeTick2(delta):
	var deltaIncrementation = delta * snakeSpeed
	snakeX += deltaIncrementation
	stutteredSnakePositionPrintModulo += deltaIncrementation

func movingSnakeTick1_unstable_by_user_defined(delta):
	var deltaIncrementation = delta * snakeSpeed
	snakeX += deltaIncrementation
	stutteredSnakePositionPrintModulo += deltaIncrementation
	var moduloResult = Main.floatModulo(snakeX, float(squareWidth))
	if moduloResult < userTurnMarginDelta and turnedThisLoop == false:
		turnedThisLoop = true
		var printMsg = "Can turn! snakeX: " + str(snakeX)
		print(printMsg)
		debugTurnableSpots.push_back(printMsg)
	
	if moduloResult > userTurnMarginDelta and turnedThisLoop == true:
		turnedThisLoop = false
	


func movingSnakeTick0(delta):
	snakeX += delta

##no-loop methods:

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
	#Main.localSystemError(errorMsg)
	printerr(errorMsg)
	#push_warning(errorMsg)
	#push_error(errorMsg)		#the red text is better for this so this method works better for my purposes.

func testingFloats0():
	if 3.3 > 3.299:
		print("yes 3.3 is bigger than 3.299")
	if 3.3 < 3.299:
		print("Output: true. Error: expected false.")

func _subprocess_quit():
	get_tree().quit()
