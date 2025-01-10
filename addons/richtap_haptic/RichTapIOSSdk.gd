@tool
extends BaseRichTapPlatformSdk
class_name RichTapIOSSdk
var _plugin_name = "RichTapPlayIosPlugin"
var _haptic_plugin

func _ready():
	if Engine.has_singleton(_plugin_name):
		_haptic_plugin = Engine.get_singleton(_plugin_name)
	else:
		printerr("Couldn't find plugin " + _plugin_name)

func initHaptic():
	if Engine.has_singleton(_plugin_name):
		_haptic_plugin = Engine.get_singleton(_plugin_name)
	else:
		printerr("Couldn't find plugin " + _plugin_name)

func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0): 
	print("RichTapIOSSdk amplitude",amplitude)
	return _haptic_plugin.playHaptic(he,loopCount,amplitude,interval,freq,0)
	
func stopHaptic():
	_haptic_plugin.stopHaptic(0)

func stopHapticById(playId):
	_haptic_plugin.stopHaptic(playId)
	
func playExtPrebaked(prebakedId: int, strength: int):
	_haptic_plugin.playExtPrebaked(prebakedId,strength)
	
func getSdkVersion() :
	return _haptic_plugin.getSdkVersion()

func isSupportedRichTap() :
	return _haptic_plugin.isSupportedRichTap()
		
func getDuration(json:String):
	return _haptic_plugin.getLength(json)
	
func setIosGain(amplitude: int,playId: int = 0) :
	_haptic_plugin.setGain(playId,amplitude)

func setHapticMode(playerType:int) :
	return _haptic_plugin.setHapticMode(playerType)

func isPlaying() :
	return _haptic_plugin.isPlaying()
	
func getPrebakedDuration(prebackId: int) :
	return _haptic_plugin.getPrebakedLength(prebackId)

func _exit_tree():
	print("RichTapSdk _exit_tree")
	_haptic_plugin.quit()
	_haptic_plugin = null
