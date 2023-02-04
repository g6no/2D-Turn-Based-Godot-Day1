extends Control

signal sword
signal block
signal magic
signal chat

onready var hp_label = $StatsPanel/HBoxContainer/HPLabel
onready var mp_label = $StatsPanel/HBoxContainer/MPLabel

func _on_SwordButton_pressed():
	emit_signal("sword")

func _on_BlockButton_pressed():
	emit_signal("block")

func _on_MagicButton_pressed():
	emit_signal("magic")

func _on_ChatButton_pressed():
	emit_signal("chat")

func _on_Player_hp_changed(value):
	hp_label.text = "HP\n"+str(value)

func _on_Player_mp_changed(value):
	mp_label.text = "MP\n"+str(value)
