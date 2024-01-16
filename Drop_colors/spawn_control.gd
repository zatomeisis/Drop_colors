extends Node

# Supongamos que tienes tres tipos de objetos representados por nodos o escenas
@export var objeto_naranja : PackedScene
@export var objeto_violeta : PackedScene
@export var objeto_verde : PackedScene

@onready var spawn_timer = $spawn_timer

func start():
	spawn_timer.start()

func _on_spawn_timer_timeout():
	var indice_aleatorio = randi() % 3 + 1
	
	var objeto_elegido
	
	match indice_aleatorio:
		1:
			objeto_elegido = objeto_naranja
		2:
			objeto_elegido = objeto_verde
		3:
			objeto_elegido = objeto_violeta
	
	var empezar_spawn = objeto_elegido.instantiate()
	
	empezar_spawn.global_position = $Marker2D.global_position
	$Marker2D.add_child(empezar_spawn)
