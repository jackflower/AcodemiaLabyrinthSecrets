extends Area2D

# 2020-02-29 acodemia.pl

var damage = 0

func _ready():
	pass
	
	
func _on_AnimationPlayer_animation_finished( anim_name ):
	queue_free()
	get_parent().queue_free()
	pass
	
	
func _on_MineExplosion_body_entered( body ):
	if(body.has_method("update_health")):
		body.update_health(int(damage))
	get_node("CollisionShape2D").disabled = true
	pass
	