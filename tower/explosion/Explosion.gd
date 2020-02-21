extends Area2D

# 2020-02-29 acodemia.pl

func _on_AnimationPlayer_animation_finished( anim_name ):
	self.queue_free()
	pass
