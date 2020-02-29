extends Node2D

# 2020-02-29 acodemia.pl

func _ready():
	pass
	
	
func _on_ActivationZone_body_entered( body ):
	#print("Mech in zone...") # testy
	if(body.has_method("has_keys")):
		if(body.has_keys()):
			$AnimationPlayer.play("door_open_animation")
	pass
	
	
func _on_AnimationPlayer_animation_finished( anim_name ):
	$ActivationZone.get_node("CollisionShape2D").disabled = true
	pass
	
