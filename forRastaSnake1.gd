extends Node


func main():
	print(getFromFloatDivisorCount(12.3, 5))


func getFromFloatDivisorCount(v: float, divider: int) -> int:
	var count = 0
	var processed: float = v
	while processed >= 0:
		processed -= divider
		count += 1
	count -= 1
	return count

func test0_floatIntegerDivision() -> void: #result:
			#default behaviour doesn't do what I need code to do.
	
	print(12.3/5)
	
	return
