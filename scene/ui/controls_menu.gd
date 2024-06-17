extends CanvasLayer

@onready var label_container = $MarginContainer/HBoxContainer/LabelContainer
@onready var button_container = $MarginContainer/HBoxContainer/HBoxContainer/ButtonContainer

var searchingKey:bool = false;
var current_button:Button = null;

func _ready():
	for action in InputMap.get_actions():
		match action:
			'jump':
				addButton(InputMap.action_get_events(action)[0].as_text())
				addLabel('Saut')
			'controller_right':
				addButton(InputMap.action_get_events(action)[0].as_text())
				addLabel('Aller à droite')
			'controller_left':
				addButton(InputMap.action_get_events(action)[0].as_text())
				addLabel('Aller à gauche')
			'dash':
				addButton(InputMap.action_get_events(action)[0].as_text())
				addLabel('Roulade')

func _input(event):
	if event is InputEventKey:
		if (searchingKey):
			current_button.text = event.as_text_keycode()
			searchingKey = false
			current_button = null

func _on_button_pressed(button):
	print(button)
	searchingKey = !searchingKey
	#current_button = button
	if (searchingKey):
		#button.text = 'Press any key'
		pass
	else:
		#button.text = 'undefined'
		pass
	pass
	
func addLabel(labelText):
	var label = Label.new()
	label.text = labelText
	label_container.add_child(label)
	
func addButton(buttonKey):
	var button = Button.new()
	button.text = buttonKey
	button.connect("pressed", _on_button_pressed(button))
	button_container.add_child(button)
