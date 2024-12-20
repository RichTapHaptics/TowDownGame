extends Object
class_name RichTapAndroidSdk
# TODO: Update to match your plugin's name
var _plugin_name = "RichTapHapticAndroidPlugin"

var _haptic_plugin

func _ready():
	if Engine.has_singleton(_plugin_name):
		_haptic_plugin = Engine.get_singleton(_plugin_name)
	else:
		printerr("Couldn't find plugin " + _plugin_name)

func initHaptic() :
	if Engine.has_singleton(_plugin_name):
		print("jiangzb 创建RichTapHapticAndroidPlugin")
		_haptic_plugin = Engine.get_singleton(_plugin_name)
	_haptic_plugin.initHaptic()
	
func enableDebug(enable:bool):
	_haptic_plugin.debug(enable)

 #/**
	 #* 播放效果
	 #* @param he json字符串
	 #* @param loopCount 循环次数 取值范围是大于等于-1，-1表示无限再循环
	 #* @param interval  间隔 表示两次播放之间的时间间隔
	 #* @param amplitude 强度缩放值 取值范围是[0,511]，255表示不对HE强度做缩放
	 #* @param freq 变频值 取值范围[-100, 100]，0表示不对HE做变频
	 #*/
func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0): 
	_haptic_plugin.playHaptic(he,loopCount,interval,amplitude,freq)
	
	
func stopHaptic():
	_haptic_plugin.stopHaptic()
	
func playExtPrebaked(prebakedId: int, strength: int):
	_haptic_plugin.playExtPrebaked(prebakedId,strength)
	
func updatePlayerParameter(amplitude: int, interval: int) :
	_haptic_plugin.updatePlayerParameter(amplitude, interval)
	
	
func setGain(gain: int) :
	_haptic_plugin.setGain(gain)
	
	
func getSdkVersion() :
	return _haptic_plugin.getSdkVersion()
	
func isSupportedRichTap() :
	return _haptic_plugin.isSupportedRichTap()

func getCoreVersion() :
	return _haptic_plugin.getCoreVersion()
	
func isPlayerTypeAvailable(playerType:int) :
	return _haptic_plugin.isPlayerTypeAvailable(playerType)

func getDuration(json:String):
	return _haptic_plugin.getDuration(json)
	
func selectPlayer(playerType: int) :
	return	_haptic_plugin.getInstance().selectPlayer(playerType)

func _exit_tree():
	print("RichtapSdk _exit_tree")
	_haptic_plugin.release()
	_haptic_plugin = null

