extends StaticBody3D

@onready var SolarPanelModule = preload("res://src/ships/Stations/RandStationBlue/SolarPanel_module_blue.tscn")
@onready var SixWayConnector = preload("res://src/ships/Stations/RandStationBlue/6-WayConnector.tscn")
@onready var GravityRing = preload("res://src/ships/Stations/RandStationBlue/Gravity Ring Module.tscn")
@onready var dock1 = $"dock1"
# Called when the node enters the scene tree for the first time.

func _ready():
	if randi()% 2 ==0:
		if randi() % 2 == 0:
			var SolarPanelModule1 = SolarPanelModule.instantiate()
			dock1.add_child(SolarPanelModule1)

		else:
			var gravityRingModule = GravityRing.instantiate()
			dock1.add_child(gravityRingModule)
	else: 
		var sixWayConnModule= SixWayConnector.instantiate()
		dock1.add_child(sixWayConnModule)

