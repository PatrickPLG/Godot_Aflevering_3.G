#StartMenu.gd
extends Control

func _ready():
	if Global.score > Global.high_score:
			Global.high_score = Global.score
	
	$CenterContainer2/VBoxContainer/HighScoreText.text = "Highscore: " + str(Global.high_score)

# Når man klikker på knappen StartGameButton starter den World.tscn
func _on_StartGameButton_pressed():
	get_tree().change_scene("res://World.tscn")

# Når man klikker på QuitGameButton lukker den spillet
func _on_QuitGameButton_pressed():
	get_tree().quit()
