extends Node2D

const SIZE := Vector2(540, 960)
const GROUND := 792.0
const PLAYER_X := 112.0
const SPEED := 275.0
const GRAVITY := 1750.0
const JUMP_POWER := -650.0
const GOAL := 6200.0
const SHEET := preload("res://assets/art/characters/luana/luana_actions_v1.png")
const LUANA_RUN_CONTACT := preload("res://assets/art/characters/luana/v2/luana_run_contact_v2.png")
const LUANA_RUN_PASSING := preload("res://assets/art/characters/luana/v2/luana_run_passing_v2.png")
const LUANA_JUMP_SHORT := preload("res://assets/art/characters/luana/v2/luana_jump_short_v2.png")
const LUANA_JUMP_LONG := preload("res://assets/art/characters/luana/v2/luana_jump_long_v2.png")
const BACKGROUND := preload("res://assets/art/backgrounds/beach_run_background_v1.png")
const SEAGULL := preload("res://assets/art/obstacles/seagull_flying_v1.png")
const BEACH_DOG := preload("res://assets/art/obstacles/beach_dog_running_v1.png")
const PLAYER_RUN_SCALE := 0.095

var luana: Sprite2D
var player_y := GROUND
var velocity_y := 0.0
var distance := 0.0
var pressure := 16.0
var dignity := 100
var paper := 0
var mayhem := 0
var state := "splash"
var slide_time := 0.0
var hold_time := 0.0
var jump_held := false
var relief_cooldown := 0.0
var jump_extended := false
var world_time := 0.0
var splash_time := 0.0
var press_point := Vector2.ZERO
var press_active := false
var last_tap := -10.0
var course: Array[Dictionary] = []
var pressure_fill: ColorRect
var distance_label: Label
var score_label: Label
var paper_label: Label
var event_label: Label
var relief_label: Label
var result_panel: Panel
var result_title: Label
var result_text: Label
var splash_panel: Panel
var menu_panel: Panel
var tutorial_panel: Panel


func _ready() -> void:
	build_backdrop()
	build_player()
	build_hud()
	build_frontend()
	build_course()
	queue_redraw()
	if "--capture-preview" in OS.get_cmdline_user_args() or "--capture-preview" in OS.get_cmdline_args():
		print("Bathroom Mayhem QA capture requested")
		capture_preview.call_deferred()


func _process(delta: float) -> void:
	world_time += delta
	if state == "splash":
		splash_time += delta
		if splash_time >= 1.4:
			show_menu()
	queue_redraw()


func capture_preview() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	RenderingServer.force_draw()
	var image := get_viewport().get_texture().get_image()
	if image:
		image.save_png("/tmp/bathroom-mayhem-preview.png")
	else:
		push_warning("Viewport capture is unavailable with the active headless renderer.")
	get_tree().quit()


func build_backdrop() -> void:
	var layer := CanvasLayer.new()
	layer.layer = -1
	var image := TextureRect.new()
	image.texture = BACKGROUND
	image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	image.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	image.modulate = Color(1, 1, 1, 0.72)
	layer.add_child(image)
	add_child(layer)


func build_player() -> void:
	luana = Sprite2D.new()
	luana.position = Vector2(PLAYER_X, player_y - 61.0)
	luana.z_index = 8
	add_child(luana)
	set_luana_texture(LUANA_RUN_CONTACT, PLAYER_RUN_SCALE)


func set_luana_frame(region: Rect2, scale_value: float) -> void:
	var atlas := AtlasTexture.new()
	atlas.atlas = SHEET
	atlas.region = region
	luana.texture = atlas
	luana.scale = Vector2.ONE * scale_value


func set_luana_texture(texture: Texture2D, scale_value: float) -> void:
	luana.texture = texture
	luana.scale = Vector2.ONE * scale_value


func build_course() -> void:
	for spec in [[650.0,"paper",705.0],[975.0,"tourist",792.0],[1210.0,"water",700.0],[1490.0,"seagull",720.0],[1790.0,"paper",705.0],[2080.0,"dog",792.0],[2390.0,"coffee",700.0],[2690.0,"seagull",720.0],[3020.0,"paper",705.0],[3350.0,"tourist",792.0],[3640.0,"water",700.0],[3950.0,"dog",792.0],[4280.0,"paper",705.0],[4560.0,"seagull",720.0],[4880.0,"paper",705.0],[5200.0,"tourist",792.0],[5520.0,"water",700.0],[GOAL,"toilet",676.0]]:
		course.append({"x": spec[0], "kind": spec[1], "y": spec[2], "used": false})


func _physics_process(delta: float) -> void:
	if state != "running":
		return
	distance += SPEED * delta
	pressure += 5.9 * delta
	relief_cooldown = maxf(0.0, relief_cooldown - delta)
	slide_time = maxf(0.0, slide_time - delta)
	if Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_pressed("jump") and jump_held and hold_time < 0.18 and velocity_y < 0:
		hold_time += delta
		velocity_y -= 780.0 * delta
		jump_extended = jump_extended or hold_time >= 0.06
	if Input.is_action_just_released("jump"):
		jump_held = false
	if Input.is_action_just_pressed("slide"):
		slide()
	if Input.is_action_just_pressed("relief"):
		relief()
	velocity_y += GRAVITY * delta
	player_y += velocity_y * delta
	if player_y >= GROUND:
		player_y = GROUND
		velocity_y = 0.0
	update_luana()
	check_course()
	update_hud()
	if pressure >= 100:
		finish(false, "CODE BROWN! A pressão venceu.")
	queue_redraw()


func update_luana() -> void:
	luana.position = Vector2(PLAYER_X, player_y - (48.0 if sliding() else 61.0))
	if sliding():
		set_luana_frame(Rect2(932, 410, 310, 392), 0.27)
	elif player_y < GROUND - 8:
		set_luana_texture(LUANA_JUMP_LONG if jump_extended else LUANA_JUMP_SHORT, PLAYER_RUN_SCALE)
	elif pressure >= 72:
		set_luana_frame(Rect2(320, 820, 315, 405), 0.29)
	else:
		set_luana_texture(LUANA_RUN_CONTACT if int(distance / 58.0) % 2 == 0 else LUANA_RUN_PASSING, PLAYER_RUN_SCALE)


func sliding() -> bool:
	return slide_time > 0 and player_y >= GROUND - 1


func jump() -> void:
	if player_y >= GROUND - 1 and not sliding():
		velocity_y = JUMP_POWER * 0.84
		hold_time = 0
		jump_extended = false
		jump_held = true
		show_event("PULO!", Color("dffcff"))


func slide() -> void:
	if player_y >= GROUND - 1:
		slide_time = 0.55
		show_event("SLIDE!", Color("ffe09b"))


func relief() -> void:
	if relief_cooldown > 0:
		show_event("ALÍVIO RECARGANDO", Color("ffcf7d"))
		return
	pressure = maxf(0, pressure - 24)
	dignity = max(0, dignity - 9)
	mayhem += 1
	relief_cooldown = 3
	show_event("CONTROLLED RELIEF  •  PRESSURE -24", Color("a7f4c0"))


func player_box() -> Rect2:
	return Rect2(PLAYER_X - 31, GROUND - 38, 63, 35) if sliding() else Rect2(PLAYER_X - 27, player_y - 82, 55, 78)


func object_box(kind: String, x: float, y: float) -> Rect2:
	if kind in ["paper", "water", "coffee"]:
		return Rect2(x - 25, y - 25, 50, 50)
	if kind in ["low", "tourist", "dog"]:
		return Rect2(x - 35, y - 40, 70, 45)
	if kind in ["high", "seagull"]:
		return Rect2(x - 45, y - 15, 90, 36)
	return Rect2(x - 42, y - 95, 84, 105)


func check_course() -> void:
	for item in course:
		if item.used:
			continue
		var x: float = item.x - distance + PLAYER_X
		if x < -180 or x > 720:
			continue
		if not player_box().intersects(object_box(item.kind, x, item.y)):
			continue
		match item.kind:
			"paper":
				item.used = true; paper += 1; pressure = maxf(0, pressure - 4); show_event("PAPEL +1  •  PRESSURE -4", Color("fff4a3"))
			"water":
				item.used = true; pressure = maxf(0, pressure - 12); show_event("ÁGUA DE COCO  •  PRESSURE -12", Color("a5f5ff"))
			"coffee":
				item.used = true; pressure = minf(100, pressure + 14); mayhem += 2; show_event("CAFÉ! PÉSSIMA IDEIA", Color("ffb871"))
			"low", "tourist", "dog":
				finish(false, "TROMBOU NO CAOS DA PRAIA!")
			"high", "seagull":
				if not sliding(): finish(false, "A GAIVOTA PEGOU VOCÊ!")
			"toilet":
				finish(true, "CHEGOU AO SANTO TRONO!")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R and state in ["won", "lost"]:
		get_tree().reload_current_scene()
		return
	if state != "running":
		return
	if event is InputEventScreenTouch:
		if event.pressed:
			var now := Time.get_ticks_msec() / 1000.0
			if now - last_tap <= 0.28:
				relief(); last_tap = -10; press_active = false; return
			last_tap = now; press_active = true; press_point = event.position; jump()
		elif press_active:
			press_active = false; jump_held = false
	elif event is InputEventScreenDrag and press_active and event.position.y - press_point.y > 64:
		press_active = false; jump_held = false; slide()
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			press_active = true; press_point = event.position; jump()
		else:
			press_active = false; jump_held = false
	elif event is InputEventMouseMotion and press_active and event.position.y - press_point.y > 64:
		press_active = false; jump_held = false; slide()


func _draw() -> void:
	draw_parallax()
	draw_rect(Rect2(0, 638, 540, 322), Color("f8cf82"))
	draw_rect(Rect2(0, 754, 540, 206), Color("edb96b"))
	var offset := fmod(distance * 0.38, 110.0)
	for stripe_x in range(-120, 660, 110):
		draw_line(Vector2(stripe_x - offset, 832), Vector2(stripe_x + 58 - offset, 832), Color(0.74, 0.47, 0.22, 0.25), 3)
	for item in course:
		if not item.used:
			var x: float = item.x - distance + PLAYER_X
			if x > -120 and x < 660: draw_object(item.kind, Vector2(x, item.y))


func draw_parallax() -> void:
	# Three independent speeds make the vertical beach feel like a real scrolling course.
	var far_shift := fmod(distance * 0.10, 260.0)
	for x in range(-260, 800, 260):
		var base := x - far_shift
		draw_colored_polygon(PackedVector2Array([Vector2(base, 624), Vector2(base + 72, 530), Vector2(base + 152, 624)]), Color(0.18, 0.55, 0.60, 0.24))
	var mid_shift := fmod(distance * 0.24, 180.0)
	for x in range(-180, 720, 180):
		var base := x - mid_shift
		draw_line(Vector2(base + 34, 652), Vector2(base + 34, 575), Color(0.25, 0.40, 0.30, 0.70), 7)
		draw_circle(Vector2(base + 34, 565), 28, Color(0.18, 0.48, 0.33, 0.72))
		draw_circle(Vector2(base + 15, 577), 19, Color(0.21, 0.56, 0.37, 0.72))
		draw_circle(Vector2(base + 54, 577), 19, Color(0.21, 0.56, 0.37, 0.72))
	var near_shift := fmod(distance * 0.55, 135.0)
	for x in range(-135, 675, 135):
		var base := x - near_shift
		draw_arc(Vector2(base + 56, 734), 34, PI, TAU, 18, Color(1, 1, 0.92, 0.52), 3)


func draw_object(kind: String, p: Vector2) -> void:
	match kind:
		"paper":
			draw_circle(p, 23, Color("fff5d6")); draw_circle(p, 12, Color("5acbd1")); draw_arc(p, 23, 0, TAU, 24, Color("173c5d"), 3)
		"water":
			draw_circle(p, 25, Color("66dded")); draw_circle(p + Vector2(-8,-9), 8, Color("e7ffff"))
		"coffee":
			draw_circle(p, 24, Color("7a3f29")); draw_circle(p, 14, Color("241510")); draw_arc(p + Vector2(24,0), 12, -1.2, 1.2, 14, Color("fff1d0"), 5)
		"low":
			draw_rect(Rect2(p.x-42,p.y-42,84,42), Color("ef765e")); draw_rect(Rect2(p.x-42,p.y-42,84,42), Color("173c5d"), false, 4); draw_line(p+Vector2(-28,-31),p+Vector2(28,-12),Color("ffe299"),5)
		"tourist":
			draw_tourist(p)
		"dog":
			var dog_bob := sin(world_time * 11.0 + p.x * 0.03) * 4.0
			draw_texture_rect(BEACH_DOG, Rect2(p.x - 58, p.y - 54 + dog_bob, 116, 77), false)
		"seagull":
			var bird_bob := sin(world_time * 7.0 + p.x * 0.02) * 7.0
			draw_texture_rect(SEAGULL, Rect2(p.x - 58, p.y - 39 + bird_bob, 116, 77), false)
			var wing_lift := absf(sin(world_time * 8.0 + p.x * 0.02)) * 13.0
			draw_line(Vector2(p.x + 4, p.y - 18 + bird_bob), Vector2(p.x + 31, p.y - 38 - wing_lift + bird_bob), Color("173c5d"), 3)
		"high":
			draw_line(p+Vector2(-46,68),p+Vector2(-46,-20),Color("72482b"),10); draw_rect(Rect2(p.x-46,p.y-20,112,40),Color("ff8c58")); draw_rect(Rect2(p.x-46,p.y-20,112,40),Color("173c5d"),false,4); draw_string(ThemeDB.fallback_font,p+Vector2(-31,7),"BAIXE!",HORIZONTAL_ALIGNMENT_LEFT,-1,16,Color("fff7df"))
		"toilet":
			draw_rect(Rect2(p.x-52,p.y-118,104,118),Color("62d2d3")); draw_rect(Rect2(p.x-52,p.y-118,104,118),Color("173c5d"),false,5); draw_rect(Rect2(p.x-32,p.y-88,64,88),Color("fff5dd")); draw_string(ThemeDB.fallback_font,p+Vector2(-29,-98),"WC",HORIZONTAL_ALIGNMENT_LEFT,-1,26,Color("173c5d"))


func draw_tourist(p: Vector2) -> void:
	# Deliberately simple silhouette: readable at mobile scale and distinct from Luana.
	var outline := Color("173c5d")
	draw_circle(p + Vector2(-2, -78), 17, Color("f2b279"))
	draw_arc(p + Vector2(-2, -78), 17, 0, TAU, 18, outline, 3)
	draw_circle(p + Vector2(-7, -81), 2.5, outline)
	draw_rect(Rect2(p.x - 25, p.y - 61, 50, 42), Color("45cbd0"))
	draw_rect(Rect2(p.x - 25, p.y - 61, 50, 42), outline, false, 3)
	draw_circle(p + Vector2(6, -43), 6, Color("fff5d6")); draw_circle(p + Vector2(-10, -33), 5, Color("fff5d6"))
	var stride := sin(world_time * 6.0 + p.x * 0.02) * 8.0
	draw_line(p + Vector2(-16, -20), p + Vector2(-26 + stride, -2), outline, 11)
	draw_line(p + Vector2(15, -20), p + Vector2(27 - stride, -2), outline, 11)
	draw_line(p + Vector2(-16, -20), p + Vector2(-26 + stride, -2), Color("ef765e"), 6)
	draw_line(p + Vector2(15, -20), p + Vector2(27 - stride, -2), Color("ef765e"), 6)
	draw_rect(Rect2(p.x + 22, p.y - 55, 15, 26), Color("ffe09b")); draw_rect(Rect2(p.x + 22, p.y - 55, 15, 26), outline, false, 2)


func build_hud() -> void:
	var layer := CanvasLayer.new(); layer.layer = 5; add_child(layer)
	var root := Control.new(); root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); root.mouse_filter = Control.MOUSE_FILTER_IGNORE; layer.add_child(root)
	root.add_child(make_panel(Rect2(16,18,508,134),Color("102c46"),18))
	var title := label("BATHROOM MAYHEM",20,Color.WHITE,Rect2(32,28,470,26)); root.add_child(title)
	root.add_child(label("PRESSURE",15,Color("ffefc7"),Rect2(32,62,100,22)))
	var back := ColorRect.new(); back.position=Vector2(133,66); back.size=Vector2(250,17); back.color=Color("402946"); root.add_child(back)
	pressure_fill=ColorRect.new(); pressure_fill.position=Vector2(133,66); pressure_fill.size=Vector2(40,17); root.add_child(pressure_fill)
	paper_label=label("PAPEL 00",16,Color("fff3c7"),Rect2(398,61,108,25)); root.add_child(paper_label)
	distance_label=label("BANHEIRO 6.2 km",16,Color("d6f8ff"),Rect2(32,104,190,25)); root.add_child(distance_label)
	score_label=label("DIGNIDADE 100  •  CAOS x0",16,Color("ffd88e"),Rect2(230,104,270,25)); score_label.horizontal_alignment=HORIZONTAL_ALIGNMENT_RIGHT; root.add_child(score_label)
	event_label=label("",19,Color.WHITE,Rect2(32,175,476,32)); event_label.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; root.add_child(event_label)
	root.add_child(make_panel(Rect2(16,856,508,88),Color(0.04,0.11,0.18,0.82),18))
	var guide:=label("TOQUE: PULO  •  SEGURE: ALTO  •  SWIPE ↓: SLIDE",15,Color("f5fbff"),Rect2(26,865,488,24)); guide.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; root.add_child(guide)
	relief_label=label("TOQUE DUPLO: CONTROLLED RELIEF",15,Color("9ff1d6"),Rect2(26,899,488,24)); relief_label.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; root.add_child(relief_label)
	result_panel=make_panel(Rect2(50,327,440,306),Color("102c46"),30); result_panel.visible=false; root.add_child(result_panel)
	result_title=label("",30,Color("fff0bd"),Rect2(70,365,400,48)); result_title.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; root.add_child(result_title)
	result_text=label("",18,Color.WHITE,Rect2(84,433,372,150)); result_text.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; result_text.vertical_alignment=VERTICAL_ALIGNMENT_CENTER; root.add_child(result_text)


func build_frontend() -> void:
	var layer := CanvasLayer.new(); layer.layer = 10; add_child(layer)
	var root := Control.new(); root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); layer.add_child(root)
	splash_panel = make_panel(Rect2(0, 0, 540, 960), Color("102c46"), 0); splash_panel.mouse_filter = Control.MOUSE_FILTER_STOP; root.add_child(splash_panel)
	var splash_title := label("BATHROOM\nMAYHEM", 48, Color("fff0bd"), Rect2(45, 275, 450, 132)); splash_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; splash_title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER; splash_panel.add_child(splash_title)
	var splash_sub := label("FULL PRESSURE", 21, Color("68e2da"), Rect2(45, 420, 450, 32)); splash_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; splash_panel.add_child(splash_sub)
	var splash_wait := label("CARREGANDO A EMERGÊNCIA...", 16, Color("fff5d6"), Rect2(45, 730, 450, 28)); splash_wait.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; splash_panel.add_child(splash_wait)

	menu_panel = make_panel(Rect2(28, 120, 484, 700), Color("102c46"), 28); menu_panel.visible = false; menu_panel.mouse_filter = Control.MOUSE_FILTER_STOP; root.add_child(menu_panel)
	var menu_title := label("BATHROOM MAYHEM", 32, Color("fff0bd"), Rect2(24, 70, 436, 54)); menu_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; menu_panel.add_child(menu_title)
	var menu_sub := label("FULL PRESSURE\nChegue ao banheiro antes do desastre.", 18, Color("b9f8f3"), Rect2(38, 145, 408, 65)); menu_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; menu_sub.vertical_alignment = VERTICAL_ALIGNMENT_CENTER; menu_panel.add_child(menu_sub)
	var play := make_button("CORRER!", Rect2(70, 288, 344, 70)); play.pressed.connect(show_tutorial); menu_panel.add_child(play)
	var how := make_button("COMO JOGAR", Rect2(70, 380, 344, 58)); how.pressed.connect(show_tutorial); menu_panel.add_child(how)
	var menu_note := label("Versão de teste • toque com uma mão", 15, Color("ffe09b"), Rect2(30, 570, 424, 30)); menu_note.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; menu_panel.add_child(menu_note)

	tutorial_panel = make_panel(Rect2(28, 100, 484, 740), Color("102c46"), 28); tutorial_panel.visible = false; tutorial_panel.mouse_filter = Control.MOUSE_FILTER_STOP; root.add_child(tutorial_panel)
	var tutorial_title := label("COMO JOGAR", 30, Color("fff0bd"), Rect2(24, 48, 436, 46)); tutorial_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; tutorial_panel.add_child(tutorial_title)
	var tutorial_copy := label("TOQUE\nPulo curto\n\nSEGURE\nPulo alto\n\nSWIPE ↓\nDeslize sob a gaivota\n\nTOQUE DUPLO\nControlled Relief", 19, Color("f5fbff"), Rect2(72, 122, 340, 390)); tutorial_copy.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER; tutorial_copy.vertical_alignment = VERTICAL_ALIGNMENT_CENTER; tutorial_panel.add_child(tutorial_copy)
	var start := make_button("COMEÇAR CORRIDA", Rect2(70, 600, 344, 66)); start.pressed.connect(start_run); tutorial_panel.add_child(start)


func make_button(value: String, rect: Rect2) -> Button:
	var node := Button.new(); node.text = value; node.position = rect.position; node.size = rect.size; node.add_theme_font_size_override("font_size", 20); node.add_theme_color_override("font_color", Color("102c46"))
	var normal := StyleBoxFlat.new(); normal.bg_color = Color("68e2da"); normal.corner_radius_top_left = 16; normal.corner_radius_top_right = 16; normal.corner_radius_bottom_left = 16; normal.corner_radius_bottom_right = 16
	var pressed := StyleBoxFlat.new(); pressed.bg_color = Color("fff0bd"); pressed.corner_radius_top_left = 16; pressed.corner_radius_top_right = 16; pressed.corner_radius_bottom_left = 16; pressed.corner_radius_bottom_right = 16
	node.add_theme_stylebox_override("normal", normal); node.add_theme_stylebox_override("pressed", pressed); return node


func show_menu() -> void:
	state = "menu"; splash_panel.visible = false; menu_panel.visible = true; tutorial_panel.visible = false


func show_tutorial() -> void:
	state = "tutorial"; splash_panel.visible = false; menu_panel.visible = false; tutorial_panel.visible = true


func start_run() -> void:
	state = "running"; tutorial_panel.visible = false; result_panel.visible = false
	distance = 0.0; pressure = 16.0; dignity = 100; paper = 0; mayhem = 0; player_y = GROUND; velocity_y = 0.0; course.clear(); build_course(); show_event("CORRA, LUANA!", Color("dffcff"))


func make_panel(rect: Rect2, color: Color, radius: int) -> Panel:
	var node:=Panel.new(); node.position=rect.position; node.size=rect.size; node.mouse_filter=Control.MOUSE_FILTER_IGNORE
	var style:=StyleBoxFlat.new(); style.bg_color=color; style.set_corner_radius_all(radius); style.border_color=Color("5bd6d0"); style.set_border_width_all(2); node.add_theme_stylebox_override("panel",style); return node


func label(value: String, font_size: int, color: Color, rect: Rect2) -> Label:
	var node:=Label.new(); node.text=value; node.position=rect.position; node.size=rect.size; node.add_theme_font_size_override("font_size",font_size); node.add_theme_color_override("font_color",color); node.add_theme_color_override("font_outline_color",Color("102033")); node.add_theme_constant_override("outline_size",2); node.mouse_filter=Control.MOUSE_FILTER_IGNORE; return node


func update_hud() -> void:
	pressure_fill.size.x=250.0*clampf(pressure/100.0,0,1); pressure_fill.color=Color("67ddcc").lerp(Color("ff5f70"),pressure/100.0)
	paper_label.text="PAPEL %02d"%paper; distance_label.text="BANHEIRO %.1f km"%maxf(0,(GOAL-distance)/1000.0); score_label.text="DIGNIDADE %03d  •  CAOS x%d"%[dignity,mayhem]
	relief_label.text="TOQUE DUPLO: CONTROLLED RELIEF" if relief_cooldown<=0 else "ALÍVIO RECARGA: %.1fs"%relief_cooldown


func show_event(text: String, color: Color) -> void:
	event_label.text=text; event_label.add_theme_color_override("font_color",color)


func finish(won: bool, text: String) -> void:
	if state != "running": return
	state="won" if won else "lost"; result_panel.visible=true; result_title.text="SUCESSO!" if won else "MAYHEM!"; result_title.add_theme_color_override("font_color",Color("a7f4c0") if won else Color("ff9d8f")); result_text.text="%s\n\nPapel: %d  •  Dignidade: %d\nCaos: x%d\n\nToque na tela ou R para reiniciar."%[text,paper,dignity,mayhem]; relief_label.text="TOQUE PARA RECOMEÇAR"
