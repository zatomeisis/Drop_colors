extends CanvasLayer

signal start_game
signal restart

@onready var go_timer = $go_timer

func _ready():
	$restart_button.hide()
	$game_over_text.hide()
	$"GO!_Label".hide()

func update_score(score):
	$score_label.text = str(score)

func update_vida(vida):
	$vida_label.text = str(vida)

func update_bonus(puntos_bonus):
	$bonus_label.text = str(puntos_bonus)

func update_nivel(nivel):
	$tutorial_label.text = "LEVEL: " + str(nivel)

func _on_start_button_pressed():
	start_game.emit()
	$start_button.hide()
	go_timer.start()
	$"GO!_Label".show()

func _on_restart_button_pressed():
	restart.emit()

func reinicio():
	get_tree().reload_current_scene()

func show_restart():
	$restart_button.show()
	$game_over_text.show()

func show_go():
	$"GO!_Label".hide()
