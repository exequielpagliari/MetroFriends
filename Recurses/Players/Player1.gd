
extends KinematicBody2D
export (int) var run_speed = 200
export (int) var jump_speed = -500
export (int) var gravity = 1200
var atack1 = false
var velocity = Vector2()
var jumping = false
var velocity_ant = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	var atack = Input.is_action_just_pressed("ui_accept")
	
	
	if atack:
		atack1 = true
		$AnimatedSprite.play("atack")
	else:
		atack1 = false
	
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
		if velocity.y == 0 && atack1 == false:
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("walk")
		if !velocity.y == 0 && atack1 == false:
			$AnimatedSprite.play("jump")
	if left:
		velocity.x -= run_speed
		if velocity.y == 0 && atack1 == false:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("walk")
		if !velocity.y == 0 && atack1 == false:
			$AnimatedSprite.play("jump")
		
	
		
	if velocity.x == 0 &&  atack1 == false:
		$AnimatedSprite.play("idle")
	


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	



