extends Node2D
@onready var capsule = preload("res://src/ships/Obj/capsule/Capsule.tscn")

func _on_button_pressed():
	var CapsuleInst= capsule.instantiate()
	CapsuleInst.position = Vector3(2317,790,2810)
	get_parent().get_parent().add_child(CapsuleInst)
	self.queue_free()
