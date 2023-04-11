extends RigidBody3D


const SPEED = 5.0
const MAXSPEED = 7.0

var ShipVelocity = Vector3()

@onready var emitter1 = $"MeshInstance3D3/RightUp"
@onready var emitter2 = $"MeshInstance3D3/RightDown"
@onready var emitter3 = $"MeshInstance3D4/LeftUp"
@onready var emitter4 = $"MeshInstance3D4/LeftUp"
@onready var emitter5 = $"MeshInstance3D5/Forward"
@onready var front = self.get_node("front")

@onready var bullet = preload("res://src/ships/Fighter-NPC/Bullet/Fighter1-bullet.tscn")

var targetedShip = null
var nearbyShips = []

var lookAtTimer = 2

func lookAtTargeted(ship):
	look_at(Vector3(ship.position), Vector3.UP)
	self.rotate_object_local(Vector3(0,1,0),PI/2)

func Shoot(BulletSpeed):
	var InstBullet = bullet.instantiate()
	InstBullet.BulletVelocity.x = BulletSpeed
	add_child(InstBullet)
	InstBullet.global_position = Vector3(front.position.x+2,front.position.y,front.position.z)
	
func Pursue(ship):
	var zDistance = ship.position.z - position.z
	var xDistance = ship.position.x - position.x
	var yDistance = ship.position.y - position.y
	var totalDistance = sqrt((zDistance*zDistance)+(yDistance*yDistance)+(xDistance*xDistance))
	if (totalDistance> 15):
		if ShipVelocity.x < MAXSPEED:
			ShipVelocity.x += SPEED/2
	else:
		ShipVelocity.x -= 2
		Shoot(10)
	lookAtTargeted(ship)
	

func _physics_process(delta):
	emitter1.emitting = false
	emitter2.emitting = false
	emitter3.emitting = false
	emitter4.emitting = false
	emitter5.emitting = false
	
	if targetedShip == null:
		for x in nearbyShips:
			if x.name =="Transport":
				targetedShip = x
	if targetedShip != null:
		if(nearbyShips.has(targetedShip)):
			Pursue(targetedShip)
			emitter1.emitting = true
			emitter2.emitting = true
			emitter3.emitting = true
			emitter4.emitting = true
			emitter5.emitting = true
			var velocity = transform.basis.x * ShipVelocity.x
			move_and_collide(velocity * delta)

func _on_area_3d_body_entered(body):
	if body != self:
		nearbyShips.append(body)

func _on_area_3d_body_exited(body):
	for x in nearbyShips:
		if x == body:
			nearbyShips.erase(x)
