extends Node2D
@onready var capsule = preload("res://src/ships/Obj/capsule/Capsule.tscn")
func _process(delta):
	if Input.is_action_just_pressed("ExitGUI"):
		self.queue_free()

func _on_button_pressed():
	randomize()
	var CapsuleInst= capsule.instantiate()
	var brokenStationList = []
	for x in get_parent().get_parent().get_children():
		if x.has_meta("BrokenStationBool") and x.get_meta("BrokenStationBool") == true:
			brokenStationList.append(x)
	var chosenStation = brokenStationList.pick_random()		
	CapsuleInst.position = Vector3(chosenStation.position.x+randi_range(-300,300),chosenStation.position.y+randi_range(300,400),chosenStation.position.z+randi_range(-300,300))
	get_parent().get_parent().add_child(CapsuleInst)
	self.queue_free()
