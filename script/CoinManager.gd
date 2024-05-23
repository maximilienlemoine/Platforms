extends CanvasLayer

@onready var label = $Panel/Label

var coin: int = 0
var coinsString = "%s pièces"
var coinString = "%s pièce"

func add_coin() -> void:
	coin += 1
	if coin > 1:
		label.text = coinsString % str(coin)
	else :
		label.text = coinString % str(coin)
