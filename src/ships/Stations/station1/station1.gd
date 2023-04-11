extends StaticBody3D

@onready var Station1GUI = preload("res://src/GUIs/Station1GUI/Station1GUI.tscn")


func _on_area_3d_body_entered(body):
	var gui = Station1GUI.instantiate()
	body.pitch_input = 0.0
	body.roll_input = 0.0
	body.yaw_input = 0.0
	body.ShipVelocity = Vector3(0,0,0)
	if !body.has_node("Station1GUI"):
		body.add_child(gui)
