extends Node2D

const VIEW_SIZE := Vector2(540, 960)
const WORLD_HEIGHT := 1800.0
const PLAYER_SPEED := 320.0
const TARGET_SCORE := 4
const TOUCH_RADIUS := 72.0
const TOUCH_DEAD_ZONE := 12.0
const ATLAS := preload("res://assets/sprites/bathroom_atlas.png")

# Regions in the generated 1536x1536 source atlas. Keeping them here makes
# replacing or fine-tuning prototype art straightforward.
const REGIONS := {
	"player": Rect2(20, 60, 480, 430),
	"soap": Rect2(500, 140, 360, 330),
	"duck": Rect2(850, 90, 360, 390),
	"roll": Rect2(140, 490, 460, 390),
	"puddle": Rect2(670, 520, 520, 340),
	"tile_a": Rect2(35, 890, 290, 310),
	"tile_b": Rect2(340, 890, 290, 310),
	"tile_c": Rect2(640, 890, 290, 310),
	"tile_d": Rect2(940, 890, 290, 310),
}

var player: CharacterBody2D
var score := 0
var game_over := false
var status_label: Label
var score_label: Label
var touch_id := -1
var touch_origin := Vector2.ZERO
var touch_direction := Vector2.ZERO
var joystick_base: Control
var joystick_knob: Control


func _ready() -> void:
	build_floor()
	build_boundaries()
	build_player()
	build_level()
	build_hud()
	queue_redraw()
	if "--capture-preview" in OS.get_cmdline_user_args():
		capture_preview.call_deferred()


func capture_preview() -> void:
	# QA helper: render through the real graphics backend, save one frame and quit.
	await RenderingServer.frame_post_draw
	await RenderingServer.frame_post_draw
	var image := get_viewport().get_texture().get_image()
	var result := image.save_png("/tmp/bathroom-mayhem-preview.png")
	if result != OK:
		push_error("Could not save QA preview: %s" % error_string(result))
	get_tree().quit()


func _physics_process(_delta: float) -> void:
	if game_over:
		player.velocity = Vector2.ZERO
		if Input.is_action_just_pressed("restart"):
			get_tree().reload_current_scene()
		return

	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if touch_direction.length_squared() > 0.0:
		direction = touch_direction
	player.velocity = direction * PLAYER_SPEED
	player.move_and_slide()
	player.position.x = clampf(player.position.x, 55.0, VIEW_SIZE.x - 55.0)
	player.position.y = clampf(player.position.y, 70.0, WORLD_HEIGHT - 70.0)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and game_over:
			get_tree().reload_current_scene()
			return
		if event.pressed and touch_id == -1:
			touch_id = event.index
			touch_origin = event.position
			joystick_base.position = touch_origin - joystick_base.size * 0.5
			joystick_base.visible = true
			joystick_knob.position = (joystick_base.size - joystick_knob.size) * 0.5
		elif not event.pressed and event.index == touch_id:
			reset_touch_control()
	elif event is InputEventScreenDrag and event.index == touch_id:
		var offset: Vector2 = event.position - touch_origin
		if offset.length() <= TOUCH_DEAD_ZONE:
			touch_direction = Vector2.ZERO
		else:
			touch_direction = offset.limit_length(TOUCH_RADIUS) / TOUCH_RADIUS
		var visual_offset: Vector2 = offset.limit_length(TOUCH_RADIUS)
		joystick_knob.position = (joystick_base.size - joystick_knob.size) * 0.5 + visual_offset


func reset_touch_control() -> void:
	touch_id = -1
	touch_direction = Vector2.ZERO
	if joystick_base:
		joystick_base.visible = false


func _draw() -> void:
	draw_rect(Rect2(0, 0, VIEW_SIZE.x, WORLD_HEIGHT), Color("bce9e6"))
	draw_rect(Rect2(18, 0, VIEW_SIZE.x - 36, WORLD_HEIGHT), Color("dff7f2"))


func atlas_texture(region: Rect2) -> AtlasTexture:
	var texture := AtlasTexture.new()
	texture.atlas = ATLAS
	texture.region = region
	return texture


func sprite_for(kind: String, target_size: float) -> Sprite2D:
	var sprite := Sprite2D.new()
	sprite.texture = atlas_texture(REGIONS[kind])
	var region: Rect2 = REGIONS[kind]
	var scale_factor := target_size / maxf(region.size.x, region.size.y)
	sprite.scale = Vector2.ONE * scale_factor
	return sprite


func build_floor() -> void:
	var tile_names := ["tile_a", "tile_b", "tile_c", "tile_d"]
	var index := 0
	for y in range(110, int(WORLD_HEIGHT), 145):
		for x in [90, 270, 450]:
			var tile := sprite_for(tile_names[index % tile_names.size()], 150.0)
			tile.position = Vector2(x, y)
			tile.modulate = Color(1, 1, 1, 0.78)
			tile.z_index = -2
			add_child(tile)
			index += 1


func build_player() -> void:
	player = CharacterBody2D.new()
	player.name = "Player"
	player.position = Vector2(270, 1640)
	player.z_index = 10
	add_child(player)
	player.add_child(sprite_for("player", 112.0))

	var collision := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 35.0
	collision.shape = shape
	player.add_child(collision)

	var camera := Camera2D.new()
	camera.position = Vector2(0, -140)
	camera.position_smoothing_enabled = true
	camera.position_smoothing_speed = 7.0
	camera.limit_left = 0
	camera.limit_right = int(VIEW_SIZE.x)
	camera.limit_top = 0
	camera.limit_bottom = int(WORLD_HEIGHT)
	player.add_child(camera)


func build_boundaries() -> void:
	make_wall(Vector2(5, WORLD_HEIGHT / 2.0), Vector2(10, WORLD_HEIGHT))
	make_wall(Vector2(VIEW_SIZE.x - 5, WORLD_HEIGHT / 2.0), Vector2(10, WORLD_HEIGHT))
	make_wall(Vector2(VIEW_SIZE.x / 2.0, 5), Vector2(VIEW_SIZE.x, 10))
	make_wall(Vector2(VIEW_SIZE.x / 2.0, WORLD_HEIGHT - 5), Vector2(VIEW_SIZE.x, 10))


func make_wall(position_value: Vector2, size: Vector2) -> void:
	var wall := StaticBody2D.new()
	wall.position = position_value
	var collision := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = size
	collision.shape = shape
	wall.add_child(collision)
	add_child(wall)


func build_level() -> void:
	make_collectible(Vector2(125, 1420), "soap")
	make_collectible(Vector2(420, 1130), "duck")
	make_collectible(Vector2(115, 750), "duck")
	make_collectible(Vector2(410, 330), "soap")

	make_hazard(Vector2(370, 1480))
	make_hazard(Vector2(150, 1010))
	make_hazard(Vector2(370, 650))

	make_obstacle(Vector2(270, 1250))
	make_obstacle(Vector2(260, 510))


func make_collectible(position_value: Vector2, kind: String) -> void:
	var area := Area2D.new()
	area.position = position_value
	area.z_index = 4
	area.add_child(sprite_for(kind, 82.0))
	var collision := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 29.0
	collision.shape = shape
	area.add_child(collision)
	area.body_entered.connect(func(body: Node2D) -> void:
		if body == player and not game_over:
			score += 1
			score_label.text = "COLETADOS  %d / %d" % [score, TARGET_SCORE]
			area.queue_free()
			if score >= TARGET_SCORE:
				finish_game(true)
	)
	add_child(area)


func make_hazard(position_value: Vector2) -> void:
	var area := Area2D.new()
	area.position = position_value
	area.z_index = 2
	area.add_child(sprite_for("puddle", 150.0))
	var collision := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 48.0
	collision.shape = shape
	area.add_child(collision)
	area.body_entered.connect(func(body: Node2D) -> void:
		if body == player and not game_over:
			finish_game(false)
	)
	add_child(area)


func make_obstacle(position_value: Vector2) -> void:
	var obstacle := StaticBody2D.new()
	obstacle.position = position_value
	obstacle.z_index = 5
	obstacle.add_child(sprite_for("roll", 130.0))
	var collision := CollisionShape2D.new()
	var shape := CircleShape2D.new()
	shape.radius = 43.0
	collision.shape = shape
	obstacle.add_child(collision)
	add_child(obstacle)


func build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)
	var safe_root := Control.new()
	safe_root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	safe_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(safe_root)

	var panel := ColorRect.new()
	panel.set_anchors_preset(Control.PRESET_TOP_WIDE)
	panel.offset_left = 18
	panel.offset_top = 22
	panel.offset_right = -18
	panel.offset_bottom = 116
	panel.color = Color(0.035, 0.09, 0.16, 0.9)
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	safe_root.add_child(panel)

	var title := Label.new()
	title.set_anchors_preset(Control.PRESET_TOP_WIDE)
	title.offset_left = 35
	title.offset_top = 33
	title.offset_right = -35
	title.offset_bottom = 61
	title.text = "BATHROOM MAYHEM  •  PROTÓTIPO"
	title.add_theme_font_size_override("font_size", 20)
	safe_root.add_child(title)

	score_label = Label.new()
	score_label.set_anchors_preset(Control.PRESET_TOP_WIDE)
	score_label.offset_left = 35
	score_label.offset_top = 68
	score_label.offset_right = -35
	score_label.offset_bottom = 101
	score_label.text = "COLETADOS  0 / %d" % TARGET_SCORE
	score_label.add_theme_font_size_override("font_size", 22)
	safe_root.add_child(score_label)

	var status_panel := ColorRect.new()
	status_panel.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	status_panel.offset_left = 18
	status_panel.offset_top = -82
	status_panel.offset_right = -18
	status_panel.offset_bottom = -16
	status_panel.color = Color(0.035, 0.09, 0.16, 0.84)
	status_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	safe_root.add_child(status_panel)

	status_label = Label.new()
	status_label.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	status_label.offset_left = 24
	status_label.offset_top = -78
	status_label.offset_right = -24
	status_label.offset_bottom = -20
	status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	status_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	status_label.text = "ARRASTE PARA MOVER  •  Colete tudo  •  Evite as poças"
	status_label.add_theme_font_size_override("font_size", 16)
	safe_root.add_child(status_label)

	joystick_base = Panel.new()
	joystick_base.size = Vector2(164, 164)
	joystick_base.visible = false
	joystick_base.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var base_style := StyleBoxFlat.new()
	base_style.bg_color = Color(0.04, 0.12, 0.20, 0.42)
	base_style.corner_radius_top_left = 82
	base_style.corner_radius_top_right = 82
	base_style.corner_radius_bottom_left = 82
	base_style.corner_radius_bottom_right = 82
	joystick_base.add_theme_stylebox_override("panel", base_style)
	safe_root.add_child(joystick_base)

	joystick_knob = Panel.new()
	joystick_knob.size = Vector2(68, 68)
	joystick_knob.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var knob_style := StyleBoxFlat.new()
	knob_style.bg_color = Color(0.35, 0.93, 0.91, 0.8)
	knob_style.corner_radius_top_left = 34
	knob_style.corner_radius_top_right = 34
	knob_style.corner_radius_bottom_left = 34
	knob_style.corner_radius_bottom_right = 34
	joystick_knob.add_theme_stylebox_override("panel", knob_style)
	joystick_base.add_child(joystick_knob)


func finish_game(won: bool) -> void:
	game_over = true
	if won:
		status_label.text = "BANHEIRO SALVO!  •  Toque ou R para reiniciar"
	else:
		status_label.text = "ESCORREGOU!  •  Toque ou R para tentar novamente"
	status_label.add_theme_color_override("font_color", Color("ffcf5c") if won else Color("ff8a80"))
