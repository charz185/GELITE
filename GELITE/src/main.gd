extends Node3D

@onready var NPCInst = preload("res://src/ships/transport/NonPlayerTransport.tscn")
@onready var Station1Inst = preload("res://src/ships/Stations/RandStationBlue/BlueStation.tscn")
@onready var BrokenInst = preload("res://src/ships/Stations/BrokenStation1/BrokenStation.tscn")
func randomizeSystem():
	randomize()
	for y in get_children():
		if !y.has_meta("ClearOnRandomize"):
			y.queue_free()
	for x in range(randi_range(3,10)):
		var BrokenStation = BrokenInst.instantiate()
		BrokenStation.position = Vector3(randi_range(-10000,10000),randi_range(-10000,10000),randi_range(-10000,10000))
		self.add_child(BrokenStation)
	
	for y in range(randi_range(5,10)):
		var Station1 = Station1Inst.instantiate()
		Station1.position = Vector3(randi_range(-10000,10000),randi_range(-10000,10000),randi_range(-10000,10000))
		self.add_child(Station1)
		
func _ready():
	randomize()
	#stations
	#for x in range(randi_range(3,10)):
	#	var BrokenStation = BrokenInst.instantiate()
	#	BrokenStation.position = Vector3(randi_range(-10000,10000),randi_range(-10000,10000),randi_range(-10000,10000))
	#	self.add_child(BrokenStation)
	
	for y in range(randi_range(5,20)):
		var Station1 = Station1Inst.instantiate()
		Station1.position = Vector3(randi_range(-10000,10000),randi_range(-10000,10000),randi_range(-10000,10000))
		self.add_child(Station1)
