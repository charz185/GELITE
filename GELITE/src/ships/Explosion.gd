extends Node3D

var timeLeft = 100
func _process(delta):
	timeLeft -=.5
	print(timeLeft)
	if timeLeft <= 0:
		self.queue_free()
