extends Node2D

export var damage : int = 4
export var hp : int = 30

onready var enemy = $Enemy
onready var player = $Player

func _on_UI_sword():
	enemy.hp -= damage


func _on_Enemy_enemy_dead():
	$UI/GridContainer.disabled = true

func _on_Enemy_enemy_attacks():
	player.cur_hp -= 3
