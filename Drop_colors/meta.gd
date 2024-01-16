extends Area2D

@onready var sprite_2d = $Sprite2D

var es_naranja : bool = false
var es_violeta: bool = false
var es_verde : bool = false

var score
var valor_puntos
var puntos_de_dificultad
var nivel

func _ready():
	score = 0
	valor_puntos = 10
	puntos_de_dificultad = 0
	nivel = 1
	$"../HUD".update_nivel(nivel)

func _input(event):
	if event.is_action_pressed("Naranja"):  # "Naranja" es el nombre que le di en el mapeo de acciones
		cambiar_color_naranja()
		es_naranja = true
		es_verde = false
		es_violeta = false
	if event.is_action_pressed("Verde"):  # "Naranja" es el nombre que le di en el mapeo de acciones
		cambiar_color_verde()
		es_verde = true
		es_naranja = false
		es_violeta = false
	if event.is_action_pressed("Violeta"):
		cambiar_color_violeta()
		es_violeta = true
		es_verde = false
		es_naranja = false

func cambiar_color_naranja():
	# Acceder al material del objeto
	var material = sprite_2d.get_canvas_item()

	# Verificar si hay un material y si es ShaderMaterial
	if material and material is ShaderMaterial:
		# Cambiar el color del objeto a azul
		material.shader_param("modulate", Color(0.996, 0.498, 0.176, 1))
	else:
		# Cambiar el color del objeto a azul sin un material personalizado
		modulate = Color(0.996, 0.498, 0.176, 1)

func cambiar_color_violeta():
	# Acceder al material del objeto
	var material = sprite_2d.get_canvas_item()

	# Verificar si hay un material y si es ShaderMaterial
	if material and material is ShaderMaterial:
		# Cambiar el color del objeto a azul
		material.shader_param("modulate", Color(0.651, 0.388,0.8, 1))
	else:
		# Cambiar el color del objeto a azul sin un material personalizado
		modulate = Color(0.651, 0.388,0.8, 1)

func cambiar_color_verde():
	# Acceder al material del objeto
	var material = sprite_2d.get_canvas_item()

	# Verificar si hay un material y si es ShaderMaterial
	if material and material is ShaderMaterial:
		# Cambiar el color del objeto a azul
		material.shader_param("modulate", Color(0.6, 0.851, 0.549, 1))
	else:
		# Cambiar el color del objeto a azul sin un material personalizado
		modulate = Color(0.6, 0.851, 0.549, 1)


func _on_body_entered(body):
	if body.is_in_group("naranja") and es_naranja:
		body.queue_free()
		score += valor_puntos
		$"../HUD".update_score(score)
		$"../bonus_node".puntos_bonus -= 1
		puntos_de_dificultad += 1
		level_up()
	if body.is_in_group("violeta") and es_violeta:
		body.queue_free()
		score += valor_puntos
		$"../HUD".update_score(score)
		$"../bonus_node".puntos_bonus -= 1
		puntos_de_dificultad += 1
		level_up()
	if body.is_in_group("verde") and es_verde:
		body.queue_free()
		score += valor_puntos
		$"../HUD".update_score(score)
		$"../bonus_node".puntos_bonus -= 1
		puntos_de_dificultad += 1
		level_up()

func level_up():
	if puntos_de_dificultad == 10 and $"../spawn_control/spawn_timer".wait_time > 0.5:
		$"../spawn_control/spawn_timer".wait_time -= 0.02
		nivel += 1
		puntos_de_dificultad = 0
		$"../HUD".update_nivel(nivel)
