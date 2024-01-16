extends Node

var puntos_bonus
@onready var bonus_timer = $bonus_timer
var si_actualizar_bonus = true

# Called when the node enters the scene tree for the first time.
func _ready():
	puntos_bonus = 8
	$"../HUD".update_bonus(puntos_bonus)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(si_actualizar_bonus):
		$"../HUD".update_bonus(puntos_bonus)
	else:
		pass
	if (puntos_bonus == 0):
		$"../Meta".valor_puntos = 25
		bonus_timer.start()
		puntos_bonus = 0
		si_actualizar_bonus = false


func _on_bonus_timer_timeout():
	$"../Meta".valor_puntos = 10
	puntos_bonus = 8
	$"../HUD".update_bonus(puntos_bonus)
	si_actualizar_bonus = true
