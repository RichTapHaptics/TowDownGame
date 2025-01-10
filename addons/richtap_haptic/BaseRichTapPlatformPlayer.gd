@tool
extends Object
class_name BaseRichTapPlatformSdk
func initHaptic():
	pass

 #/**
	 #* 播放效果
	 #* @param he json字符串
	 #* @param loopCount 循环次数 取值范围是大于等于-1，-1表示无限再循环
	 #* @param interval  间隔 表示两次播放之间的时间间隔
	 #* @param amplitude 强度缩放值 取值范围是[0,511]，255表示不对HE强度做缩放
	 #* @param freq 变频值 取值范围[-100, 100]，0表示不对HE做变频
	 #*/
func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0): 
	pass
	
func stopHaptic():
	pass

func playExtPrebaked(prebakedId: int, strength: int):
	pass
	
func enableDebug(enable:bool):
	pass

func updatePlayerParameter(amplitude: int, interval: int) :
	pass
	
func setGain(gain: int) :
	pass
	
func getSdkVersion() :
	pass
	
func getDuration(json:String):
	pass

