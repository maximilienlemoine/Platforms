extends Node

@onready var firstPartCamera = $"../FirstPart"
@onready var secondPartCamera = $"../SecondPart"
@onready var thridPartCamera = $"../ThridPart"
@onready var fourthPartCamera = $"../FourthPart"
@onready var lastPartCamera = $"../LastPart"

func _on_first_part_area_body_entered(body):
	if body.name == 'Player':
		firstPartCamera.set_priority(20)

func _on_first_part_area_body_exited(body):
	if body.name == 'Player':
		firstPartCamera.set_priority(0)

func _on_second_part_area_body_entered(body):
	if body.name == 'Player':
		secondPartCamera.set_priority(20)

func _on_second_part_area_body_exited(body):
	if body.name == 'Player':
		secondPartCamera.set_priority(0)

func _on_thrid_part_area_body_entered(body):
	if body.name == 'Player':
		thridPartCamera.set_priority(20)

func _on_thrid_part_area_body_exited(body):
	if body.name == 'Player':
		thridPartCamera.set_priority(0)

func _on_fourth_part_area_body_entered(body):
	if body.name == 'Player':
		fourthPartCamera.set_priority(20)

func _on_fourth_part_area_body_exited(body):
	if body.name == 'Player':
		fourthPartCamera.set_priority(0)

func _on_last_part_area_body_entered(body):
	if body.name == 'Player':
		lastPartCamera.set_priority(20)

func _on_last_part_area_body_exited(body):
	if body.name == 'Player':
		lastPartCamera.set_priority(0)
