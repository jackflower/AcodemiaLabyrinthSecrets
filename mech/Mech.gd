extends Node2D

# 2020-02-29 acodemia.pl

export (int) var mech_speed = 100
const HEALTH_MAX = 100
const HEALTH_MIN = 0

var target = Vector2()
var velocity = Vector2()
var direction = Vector2()
var health = HEALTH_MAX
var shooting = false
var bullet_data = preload("bullet/Bullet.tscn")
var fireball_data = preload("bullet/Fireball.tscn")
var current_bullet_data = bullet_data

var on_scene = false

export (float) var created_bullet_scale_factor = 1
export (float) var created_bullet_speed = 200
export (float) var bullet_caliber = 2

var red_key = false
var green_key = false
var blue_key = false

var set_of_keys = false


func _ready():
	on_scene = true
	target = self.global_position
	target.x = target.x + 0.0001 # unikamy wektora zerowego
	set_physics_process(true)
	pass
	
	
func _input(event):
	if event.is_action_pressed('Left_click'):
		target = get_global_mouse_position()
		$mech_members/AnimationPlayer.play("animation_mech_walk")
	if event.is_action_pressed('Right_click'):
		if(shooting):
			Shot()
	if event.is_action_pressed('Bullet'):
		current_bullet_data = bullet_data
	if event.is_action_pressed('Fireball'):
		current_bullet_data = fireball_data
	pass
		
		
func _physics_process(delta):
	
	velocity = (target - position).normalized() * mech_speed
	rotation = velocity.angle()

	if (target - position).length() > 5:
		move_and_slide(velocity)
	else:
		$mech_members/AnimationPlayer.play("animation_mech_walk")
	pass
	
	if(health <= HEALTH_MIN):
		self.queue_free()
	pass
		
		
func update_health(damage):
	health -= damage
	if(health < HEALTH_MIN):
		health = HEALTH_MIN
	#print("Health: " + String(health)) # testy
	get_parent().get_node("Hud/Label_health").text = str(health)
	pass
	
	
func health_regeneration(regeneration):
	health += regeneration
	if(health > HEALTH_MAX):
		health = HEALTH_MAX
	#print("Health: " + String(health)) # testy
	get_parent().get_node("Hud/Label_health").text = str(health)
	pass
	
func update_item(item):
	
	if(red_key == false):
		if(item == "red"):
			red_key = true
			#print("have a red key...") # testy
			get_parent().get_node("Hud/MarginContainer/Key_Red/Sprite").visible = true
			get_parent().get_node("Hud/MarginContainer/Key_Red/AnimationPlayer").playback_speed = 1.0
			
	if(green_key == false):
		if(item == "green"):
			green_key = true
			#print("have a green key...") # testy
			get_parent().get_node("Hud/MarginContainer/Key_Green/Sprite").visible = true
			get_parent().get_node("Hud/MarginContainer/Key_Green/AnimationPlayer").playback_speed = 1.0
			
	if(blue_key == false):
		if(item == "blue"):
			blue_key = true
			#print("have a blue key...") # testy
			get_parent().get_node("Hud/MarginContainer/Key_Blue/Sprite").visible = true
			get_parent().get_node("Hud/MarginContainer/Key_Blue/AnimationPlayer").playback_speed = 1.0
	
	if(red_key and green_key and blue_key):
		set_of_keys = true
		#print ("a set of keys is available") # testy
	
	pass
	
func _on_TimerShoot_timeout():
	shooting = true
	pass
	
	
func Shot():
	
	var bullet_left = current_bullet_data.instance()
	var bullet_right = current_bullet_data.instance()
	direction = velocity.normalized()
	
	bullet_left.bullet_direction = direction
	bullet_right.bullet_direction = direction
	
	bullet_left.global_scale = global_scale * created_bullet_scale_factor
	bullet_right.global_scale = global_scale * created_bullet_scale_factor
	
	bullet_left.global_position  = $mech_members/mech_arm_left/cannon_left.global_position
	bullet_right.global_position  = $mech_members/mech_arm_right/cannon_right.global_position
	
	bullet_left.global_rotation_degrees = $mech_members/mech_arm_left/cannon_left.global_rotation_degrees
	bullet_right.global_rotation_degrees = $mech_members/mech_arm_right/cannon_right.global_rotation_degrees
	
	bullet_left.bullet_speed = created_bullet_speed
	bullet_right.bullet_speed = created_bullet_speed
	
	bullet_left.caliber = bullet_caliber
	bullet_right.caliber = bullet_caliber
	
	get_parent().add_child(bullet_left)
	get_parent().add_child(bullet_right)
	
	pass
	