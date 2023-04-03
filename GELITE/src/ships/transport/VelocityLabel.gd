extends Label

var lastPosition = Vector3()
func _process(delta):
	self.text = str(get_parent().position - lastPosition )
	lastPosition = get_parent().position
