extends Node3D


# Called when the node enters the scene tree for the first time.
@onready var SolarPanelModule = preload("res://src/ships/Stations/RandStationBlue/SolarPanel_module_blue.tscn")
@onready var GravityRing = preload("res://src/ships/Stations/RandStationBlue/Gravity Ring Module.tscn")
@onready var bubbleModule = preload("res://src/ships/Stations/RandStationBlue/BubbleModule.tscn")

@onready var docks = [$"Tube1/dock2",$"Tube2/dock1",$"Tube2/dock2",$"Tube3/dock1",$"Tube3/dock2",]

# Called when the node enters the scene tree for the first time.

func _ready():
	for x in docks:
		if (x != $"Tube1/dock2"):
			if randi() % 2 == 0:
				var SolarPanelModule1 = SolarPanelModule.instantiate()
				x.add_child(SolarPanelModule1)
			else:
				var bubbleModule1 = bubbleModule.instantiate()
				x.add_child(bubbleModule1)
		else:
			if randi() % 2 == 0:
				if randi() % 2 == 0:
					var SolarPanelModule1 = SolarPanelModule.instantiate()
					x.add_child(SolarPanelModule1)
				else:
					var bubbleModule1 = bubbleModule.instantiate()
					x.add_child(bubbleModule1)
			else:
				var gravityRingModule = GravityRing.instantiate()
				x.add_child(gravityRingModule)
