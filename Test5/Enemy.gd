extends Node2D

signal enemy_dead
signal enemy_attacks

var hp : int = 25 setget set_hp

onready var hp_text = $HPLabel
onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite
onready var attack_timer = $AttackTimer
onready var grid = get_node("/root/Main/UI/GridContainer")

func set_hp(new_hp):
	hp = new_hp
	hp_text.text = str(hp) + " Hp"
	
	if hp <= 0:
		emit_signal("enemy_dead")
		queue_free()
	else:
		grid.hide()
		sprite.modulate = Color(1,0,0,1)
		anim_player.play("Damaged")
		yield(anim_player, "animation_finished")
		sprite.modulate = Color(1,1,1,1)
		attack_timer.start()
		yield(attack_timer, "timeout")
		sprite.modulate = Color(0.722,0.275,0.275,1)
		anim_player.play("Attack")
		yield(anim_player, "animation_finished")
		grid.show()
		emit_signal("enemy_attacks")
		sprite.modulate = Color(1,1,1,1)
