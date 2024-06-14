extends StaticBody2D

@onready var timer = $Timer
@onready var countdownLabel = $countdownLabel

func _ready():
	# Instantiate the object and store a reference to it
	var instantiated_object = preload("res://tap_rect.tscn").instance()
	add_child(instantiated_object)
	
	var tween : Tween
	tween = Tween.new()
	add_child(tween)
	
	# Define the initial and target scale
	var initial_scale = Vector2(1, 1)
	var target_scale = Vector2(0, 0)
	
	# Set up the tween to interpolate the scale property over time
	tween.interpolate_property("tapRect", "scale", initial_scale, target_scale, 10, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	# Start the tween
	tween.start()

func countdownTimer():
	var time_left = timer.time_left
	return int(time_left)
	
func _process(delta):
	countdownLabel.text = "%02d" % countdownTimer()
