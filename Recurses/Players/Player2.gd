extends Area2D
export var speed = 200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(100,100)
	
	


func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * delta * speed
	position += velocity
	
	#animación personaje
	if velocity.x != 0:
		$AnimatedSprite.play("walk")
		if velocity.x < 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
	
	pass
