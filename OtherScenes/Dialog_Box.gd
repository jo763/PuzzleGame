extends Control

var dialog = [
	"My mama always said life was like a box of chocolates. You never know what you're gonna get.",
	"Come with me if you want to live",
	"Take car. Go to mum's. Kill Phil, grab Liz, go to the Winchester, have a nice cold pint, and wait for all of this to blow over."
]




var dialog_index = 0
var finished = false
var dialogue_speed_constant = 0.013
onready var dialogue_text = $Dialogue_Text

func _ready():
	load_dialog()
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	$DialogueIcon.visible = finished

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		dialogue_text.bbcode_text = dialog[dialog_index]
		dialogue_text.percent_visible = 0
		var dialogue_print_time = len(dialog[dialog_index]) * dialogue_speed_constant
		$Tween.interpolate_property(dialogue_text,"percent_visible", 0, 1, dialogue_print_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
	pass # Replace with function body.
