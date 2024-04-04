extends RigidBody2D
var spawn_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_pos = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass
	
func box_break():
	self.set_freeze_enabled(true)
	$AnimatedSprite2D.play("broken")

func box_broken_select():
	$AnimatedSprite2D.play("broken_select")

func box_broken_unselect():
	$AnimatedSprite2D.play("broken")
	
func box_fix():
	self.set_freeze_enabled(false)
	self.position = spawn_pos
	$AnimatedSprite2D.play("default")
	$GPUParticles2D.set_emitting(true)
