extends KinematicBody2D
export (int) var run_speed = 75
export (int) var jump_speed = -450
export (int) var gravity = 350
var random_dir = 0
var velocity = Vector2()
var jumping = false
var golpe_pared = false


func movimiento_nuevo():
	random_dir = rand_range(-1, 1)
	pass
	

	
func movimiento():
	
	if random_dir > 0:
		velocity.x -= run_speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h=false
	if random_dir < 0:
		velocity.x += run_speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h=true
	if random_dir == 0:
		movimiento_nuevo()
#	print(random_dir)

func colision():
	pass

func _physics_process(delta):
	velocity.x = 0
	movimiento()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "pared":
			random_dir = random_dir * -1
		if collision.collider.name == "paredd":
#			print("paredd")
			queue_free()
			pass
		if collision.collider.name == "Slime":
			random_dir = random_dir * -1
			pass
		
