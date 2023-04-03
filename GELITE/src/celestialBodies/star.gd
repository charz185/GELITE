extends RigidBody3D

#func _process(delta):
#	for x in get_parent().get_children():
#		if x.name != "star" and x.name != "WorldEnvironment"  && x.name != "Label" and x.name!= "Explosion":
#			if x.name == "Transport" or x.name == "Transport2":
#				var mass = 100
#			else:	
#				var mass = x.mass
#			var direction = self.position - x.position
#			var distance = direction.length()
#			var forceMag = 9.8 * ((self.mass * mass) / (distance * distance))
#			var force = direction.normalized() *forceMag
#			x.position += force


func _on_area_3d_body_entered(body):
	print(body.name)
	body.queue_free()
