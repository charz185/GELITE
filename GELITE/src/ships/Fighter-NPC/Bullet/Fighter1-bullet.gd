extends RigidBody3D

var BulletVelocity = Vector3(0,0,0)

func _physics_process(delta):
	var velocity = transform.basis.x * BulletVelocity.x
	move_and_collide(velocity * delta)

func _on_area_3d_body_entered(body):
	self.queue_free()
