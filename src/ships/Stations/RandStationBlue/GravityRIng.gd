extends CharacterBody3D


const SPEED = 5.0

func _physics_process(delta):
	rotate_object_local(Vector3(0,1,0),PI/80)
