extends CharacterBody3D

#turning
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var yaw_speed = 1.25
var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0

#other 
const speed = .1
const JUMP_VELOCITY = 4.5
var ShipVelocity = Vector3()
var shipTurnVelocity = Vector3()
#instances
@onready var explosion = preload("res://src/ships/Explosion.tscn")
#parts
@onready var emitter1 = $"Area3D/enginePropulsion"
@onready var emitter2 = $"Area3D/enginePropulsion2"
@onready var emitter3 = $"Area3D/enginePropulsion3"
@onready var emitter4 = $"Area3D/enginePropulsion4"
@onready var emitter5 = $"Area3D/enginePropulsion5"
func _physics_process(delta):
	emitter1.emitting = false
	emitter2.emitting = false
	emitter3.emitting = false
	emitter4.emitting = false
	emitter5.emitting = false
	transform.basis = transform.basis.rotated(transform.basis.z,roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x,pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.orthonormalized()
	velocity = transform.basis.x * ShipVelocity.x
	move_and_collide(velocity * delta)


func _on_area_3d_body_entered(body):
	var explosionInst = explosion.instantiate()
	explosionInst.position = self.position
	add_sibling(explosionInst)
	self.queue_free()
