extends Node

var coins: int = 0

@onready var hud: CanvasLayer = $HUD

func add_coin():
	coins += 1
	hud.get_node("CoinLabel").text = "COINS: " + str(coins)
