extends Area2D

export var text_to_show = ""
enum MOODS { HAPPY, SAD, FREAKED_OUT}
export(MOODS) var mood_to_show = MOODS.HAPPY
export var one_time = true
var shown = false

func _ready():
	connect("body_entered", self, "show_text")
	connect("body_exited", self, "hide_text")

func show_text(coll):
	if coll.name == "Player" and !coll.dead:
		if one_time and shown:
			return
		shown = true
		TextDisplay.display_text(text_to_show, mood_to_show)
		

func hide_text(coll):
	if coll.name == "Player":
		TextDisplay.hide_display()