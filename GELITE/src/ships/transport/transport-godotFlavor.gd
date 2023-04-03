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
@onready var emitter1 = $"enginePropulsion"
@onready var emitter2 = $"enginePropulsion2"
@onready var emitter3 = $"enginePropulsion3"
@onready var emitter4 = $"enginePropulsion4"
@onready var emitter5 = $"enginePropulsion5"
func _physics_process(delta):
	emitter1.emitting = false
	emitter2.emitting = false
	emitter3.emitting = false
	emitter4.emitting = false
	emitter5.emitting = false
	if Input.is_action_pressed("stop"):
		yaw_input = 0
		pitch_input = 0
		roll_input = 0
		emitter1.emitting = true
		emitter2.emitting = true
		emitter3.emitting = true
		emitter4.emitting = true
		emitter5.emitting = true
		if ShipVelocity.x > 0:
			ShipVelocity.x -=speed
		else:
			ShipVelocity.x += speed
			
		if ShipVelocity.y > 0:
			ShipVelocity.y -=speed
		else:
			ShipVelocity.y +=speed
			
		if ShipVelocity.z> 0:
			ShipVelocity.z -=speed
		else:
			ShipVelocity.z +=speed
	if Input.is_action_pressed("accelerateForward"):
		emitter1.emitting = true
		if ShipVelocity.x < 5:
			ShipVelocity.x +=1
	if Input.is_action_pressed("ui_right"):
		emitter3.emitting = true
		yaw_input -=.01
	if Input.is_action_pressed("ui_left"):
		emitter2.emitting = true
		yaw_input +=.01
	
	if Input.is_action_pressed("ui_down"):
		emitter5.emitting = true
		roll_input -=.01
	if Input.is_action_pressed("ui_up"):
		emitter4.emitting = true
		roll_input +=.01
	transform.basis = transform.basis.rotated(transform.basis.z,roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x,pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.orthonormalized()
	print(str(transform.basis.x))
	velocity = transform.basis.x * ShipVelocity.x
	move_and_collide(velocity * delta)
