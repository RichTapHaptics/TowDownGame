@tool
extends BaseRichTapPlatformSdk
class_name RichTapWindowSdk
var richtapPlay: RichTapPlay

func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0):
	#print("RichTapSdk playHaptic heContent",heContent)
	print("RichTapWindowSdk playHaptic amplitude", amplitude)
	getSdkVersion()
	richtapPlay.play(he, loopCount, interval, amplitude, freq)

func setTargetControllers(index = [0]):
	var count = index.size()
	print("RichTapWindowSdk playHaptic setTargetControllers", count, "index:", index)
	richtapPlay.setTargetControllers(count, index)

func stopHaptic():
	print("RichTapWindowSdk stopHaptic")
	richtapPlay.stop()

func _enter_tree():
	richtapPlay = RichTapPlay.new()
	print("RichTapWindowSdk SdkVersion:", getSdkVersion())
	print("RichTapWindowSdk ConnectedGameControllers:", richtapPlay.getConnectedGameControllers())
	
func getSdkVersion():
	return richtapPlay.getVersionName()

func enableDebug(enable):
	richtapPlay.enableLog(enable, 0)
	
func updatePlayerParameter(intensity: int = 0, frequency: int = 0, interval: int = 0):
		print("RichTapWindowSdk sendLoopParameters intensity", intensity)
		richtapPlay.sendLoopParameters(intensity, frequency, interval)
		
func initHaptic():
	print("RichTapWindowSdk _init")
	if (richtapPlay == null):
		print("RichTapSdk playHaptic richtapPlay")
		richtapPlay = RichTapPlay.new()
		richtapPlay.initialize()
		print("RichTapWindowSdk SdkVersion:", getSdkVersion())
		print("RichTapWindowSdk ConnectedGameControllers:", richtapPlay.getConnectedGameControllers())
		#enableDebug(true)
	
func _exit_tree():
	print("RichTapWindowSdk _exit_tree")
	richtapPlay.release()
	richtapPlay = null
	
