extends Area2D

# 2020-02-29 acodemia.pl

var item
export (int) var health_portion = 5

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
	
func _on_Elixir_body_entered( body ):
	#print (self.name + ": znalazł mnie " + body.name)
	#if(body.has_method("update_item")):
	#	item = self.name
	#	body.update_item( item )
	#	
	# zmiany na podstawie tego co powyżej...
	if(body.has_method("health_regeneration")):
		print("na zdrowie...")
		body.health_regeneration(health_portion)
		pass
	queue_free()
	pass
	
