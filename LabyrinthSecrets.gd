extends Node2D

# 2020-02-29 acodemia.pl

func _ready():
	$Tower_01.setTarget($Mech)
	$Tower_02.setTarget($Mech)
	$Tower_03.setTarget($Mech)
	$Tower_04.setTarget($Mech)
	$Tower_05.setTarget($Mech)
	$Tower_06.setTarget($Mech)
	$Tower_07.setTarget($Mech)
	$Tower_08.setTarget($Mech)
	$Tower_09.setTarget($Mech)
	$Tower_10.setTarget($Mech)
	
	$Hud/Label_health.text = str($Mech.health)
	
	pass
	