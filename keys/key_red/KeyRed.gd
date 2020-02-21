extends Area2D

# 2020-02-29 acodemia.pl

var key_name = "red"


func _on_Key_Red_body_entered( body ):
	if(body.has_method("update_item")):
		body.update_item( key_name )
		queue_free()
	pass
	