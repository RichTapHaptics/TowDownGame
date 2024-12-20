@tool
extends Node2D

@export var he:HeResource
@export var playing :bool:
	set = set_playing
@export_range( -1, 100) var loop:int = 0
@export_range( 0, 511) var amplitude:int= 255
@export_range( -100, 100) var frequency:int = 0
@export_range(-1,100) var interval:int = 0
func playHaptic():
	print("RichtapPlayer playHaptic-->",OS.get_name(),RichtapSdk)
	if (he != null):
		RichtapSdk.playHaptic(he.getHeContent(), loop, interval, amplitude, frequency)

func stopHaptic():
	RichtapSdk.stopHaptic()

func getSdkVersion():
	RichtapSdk.getVersionName()

func sendLoopParameters(intensity: int = 0, freq: int = 0, interval: int = 0):
	RichtapSdk.updatePlayerParameter(intensity, freq, interval)

func openLog(enable: bool):
	RichtapSdk.openLog(enable)
	
func _enter_tree():
	print("RichtapPlayer _enter_tree")
	
func set_playing(value: bool) -> void:
	if playing != value:
		if value:
			playHaptic()
		else:
			stopHaptic()
		playing = value
