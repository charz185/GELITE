extends OmniLight3D


var timer = 20
func _process(delta):
	timer-=1
	if timer <= 0:
		self.visible = !self.visible
		timer=20
