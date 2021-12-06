extends Node

signal energy_increased
signal heat_increased
signal speed_changed
signal score_changed
signal hud_updated
signal game_started
signal game_over
signal main_menu

var score = 0
var heat = 0
var energy = 0
var speed = 1.0
var speed_step = 1.0
var high_score = 10000

const SPEED_STEPPER = 0.97
const SPEED_INCREASE = 0.055
const HEAT_INCREASE = 0.02

func main_menu():
	speed = 0.25
	heat = 0
	emit_signal("main_menu")

func start_game():
	speed_step = 1.0
	speed = 1.0
	score = 0
	heat = 0
	energy = 0
	emit_signal("game_started")
	emit_signal("hud_updated")

func add_energy_score():
	score += int(speed*111)
	emit_signal("hud_updated")
	
func collect_plasma():
	print("Plasma Collected")
	
	speed += speed_step * SPEED_INCREASE
	speed_step *= SPEED_STEPPER
	print(speed)
	
	score += 500
	emit_signal("speed_changed")
	emit_signal("energy_increased")
	emit_signal("score_changed")
	emit_signal("hud_updated")

func lose_plasma():
	print("Plasma lost")
	heat += 0.05
	emit_signal("heat_increased")
	emit_signal("hud_updated")
	if heat >= 1.0:
		speed = 0
		emit_signal("game_over")
		if high_score < score:
			high_score = score
