extends Node2D
var break_enabled = false
var mend_enabled = false
var targeted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var boxes
	var new_targeted
	
	$MendDetectorArea.position = $CharBody2D.position
	
	if break_enabled:
		boxes = $MendDetectorArea.get_overlapping_bodies()
		for box in boxes:
			if box.is_freeze_enabled() == false:
				box.box_break()
				
	if mend_enabled:
		boxes = $MendDetectorArea.get_overlapping_bodies()
		new_targeted = select_closest_object(boxes)
		if new_targeted == null and targeted != null and targeted.is_freeze_enabled():
			targeted.box_broken_unselect()
			targeted = null
		elif targeted != null and new_targeted != null and not targeted == new_targeted:
			if new_targeted.is_freeze_enabled():
				if targeted.is_freeze_enabled():
					targeted.box_broken_unselect()
				new_targeted.box_broken_select()
				targeted = new_targeted
		elif new_targeted != null and targeted == null and new_targeted.is_freeze_enabled():
			targeted = new_targeted
			targeted.box_broken_select()

			
	if Input.is_action_pressed("CastSpell"):
		if targeted != null and mend_enabled:
			targeted.box_fix()

func select_closest_object(objects):
	var closest = [null, 10000.0]
	for object in objects:
		if object.global_position.distance_to($MendDetectorArea.global_position) < closest[1]:
			closest = [object, object.global_position.distance_to($MendDetectorArea.global_position)]
	return closest[0]

func _on_trigger_break_body_entered(area):
	$BreakTimer.start()
	$TriggerBreak.set_deferred("monitoring",false)


func _on_break_timer_timeout():
	DialogueManager.show_example_dialogue_balloon(load("res://script/lvl1.dialogue"), "break")
	break_enabled = true
	$MendTimer.start()

func _on_mend_timer_timeout():
	DialogueManager.show_example_dialogue_balloon(load("res://script/lvl1.dialogue"), "mend")
	break_enabled = false
	mend_enabled = true
	$FinishBarrier/CollisionPolygon2D.disabled = true



func _on_goal_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
