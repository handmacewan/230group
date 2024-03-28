extends CharacterBody2D

@export var speed = 300
var stop = false
var NPC_in_range = false
var npcdog_in_range = false
var table_in_range = false

func on_stop_control():
	stop = true
func on_start_control():
	stop = false

func get_input():
	var input_direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	velocity = input_direction * speed
	
	
	if Input.is_action_pressed("MoveLeft"):
		$AnimatedSprite2D.play("walkR")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("MoveRight"):
		$AnimatedSprite2D.play("walkR")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("MoveDown"):
		$AnimatedSprite2D.play("walkDown")
	elif Input.is_action_pressed("MoveUp"):
		$AnimatedSprite2D.play("walkUp")
	else:
		$AnimatedSprite2D.play("idle")
		
func _physics_process(delta):
	## this is the physics engine code, game logic should be in _process
	if Level0.initializetutorial == true:
		DialogueManager.show_example_dialogue_balloon(load("res://script/lvl0.dialogue"), "tutorial0")
		Level0.initializetutorial = false
		
	if NPC_in_range == true:
		if Input.is_action_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/lvl0.dialogue"), "lvl0NPC")
			NPC_in_range = false
			return ## why return? this function is called every physics tick
	if npcdog_in_range == true:
		if Input.is_action_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/lvl0.dialogue"), "lvl0dog")
			npcdog_in_range = false
			return
	if table_in_range == true:
		if Input.is_action_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://script/lvl0.dialogue"), "lvl0table")
			table_in_range = false
			return
			
	if stop == false:
		get_input()
		move_and_slide()


func _on_detection_area_body_entered(body):
	if body.has_method("NPClvl0"):
		NPC_in_range = true
	if body.has_method("npcdog"):
		npcdog_in_range = true
	if body.has_method("table"):
		table_in_range = true


func _on_detection_area_body_exited(body):
	if body.has_method("NPClvl0"):
		NPC_in_range = false
	if body.has_method("npcdog"):
		npcdog_in_range = false
	if body.has_method("table"):
		table_in_range = false
