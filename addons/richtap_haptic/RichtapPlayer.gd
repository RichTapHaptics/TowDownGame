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
	print("RichTapPlayer playHaptic-->",OS.get_name(),RichTapSdk,amplitude)
	if (he != null):
		return RichTapSdk.playHaptic(he.getHeContent(), loop, interval, amplitude, frequency)

func stopHaptic():
	RichTapSdk.stopHaptic()

func playExtPrebaked(prebakedId: int, strength: int = 255):
	RichTapSdk.playExtPrebaked(prebakedId,strength)

func getSdkVersion():
	return RichTapSdk.getSdkVersion()

func openLog(enable: bool):
	RichTapSdk.openLog(enable)
	
func isSupportedRichTap():
	return RichTapSdk.isSupportedRichTap()
	
func setTargetControllers(index = [0]):
	RichTapSdk.setTargetControllers(index)
func _enter_tree():
	print("RichTapPlayer _enter_tree")
	
func set_playing(value: bool) -> void:
	if playing != value:
		if value:
			playHaptic()
		else:
			stopHaptic()
		playing = value
