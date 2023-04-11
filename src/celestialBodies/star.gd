extends StaticBody3D

func _on_area_3d_body_entered(body):
	print(body.name)
	body.queue_free()
