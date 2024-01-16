extends Area2D

var vida 
@onready var bonus_node = $"../bonus_node"

func _ready():
	vida = 5
	$"../HUD".update_vida(vida)

func _on_body_entered(body):
	body.queue_free()
	vida -= 1
	$"../HUD".update_vida(vida)
	$"../bonus_node".puntos_bonus += 1
	if vida == 0:
		$"../spawn_control/spawn_timer".stop()
		$"../HUD".show_restart()
		_findejuego()

func _findejuego():
	get_tree().call_group("naranja", "queue_free")
	get_tree().call_group("violeta", "queue_free")
	get_tree().call_group("verde", "queue_free")
