extends CanvasLayer

# 2020-02-29 acodemia.pl

func _ready():
	
	$MarginContainer/Key_Red/Sprite.visible = false
	$MarginContainer/Key_Green/Sprite.visible = false
	$MarginContainer/Key_Blue/Sprite.visible = false
	
	$MarginContainer/Key_Red/AnimationPlayer.playback_speed = 0.25
	$MarginContainer/Key_Green/AnimationPlayer.playback_speed = 0.25
	$MarginContainer/Key_Blue/AnimationPlayer.playback_speed = 0.25
	
	pass
	