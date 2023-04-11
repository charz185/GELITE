extends Label


func _process(delta):
	self.text = str(get_parent().position)

