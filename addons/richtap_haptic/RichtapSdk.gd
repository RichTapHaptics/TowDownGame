@tool
extends Node
var sdk

func _ready():
	if (OS.get_name() == "Android") :
		print("RichtapSdk 创建RichTapAndroidSdk")
		sdk = RichTapAndroidSdk.new()
	else: 
		print("RichtapSdk 创建RichTapWindowSdk")
		sdk = RichTapWindowSdk.new()
	initHaptic()

func initHaptic() :
	sdk.initHaptic()
	
func enableDebug(enable:bool):
	sdk.debug(enable)

func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0): 
	if (sdk == null) :
		return
	if (OS.get_name() == "Android") :
		sdk.playHaptic(he,loopCount,interval,amplitude,freq)
	else: 
		sdk.playHaptic(he,loopCount,amplitude,freq)
	
func stopHaptic():
	sdk.stopHaptic()
	
func playExtPrebaked(prebakedId: int, strength: int):
	if (sdk != null && OS.get_name() == "Android") :
		sdk.playExtPrebaked(prebakedId,strength)
	
func updatePlayerParameter(intensity: int = 0, freq: int = 0, interval: int = 0) :
	sdk.updatePlayerParameter(intensity,interval)
	
func setGain(gain: int) :
	sdk.setGain(gain)
	
func getSdkVersion() :
	return sdk.getSdkVersion()
	
func isSupportedRichTap() :
	if (OS.get_name() == "Android") :
		return sdk.isSupportedRichTap()

func getCoreVersion() :
	if (OS.get_name() == "Android") :
		return sdk.getCoreVersion()
	
func isPlayerTypeAvailable(playerType:int) :
	if (OS.get_name() == "Android") :
		return sdk.isPlayerTypeAvailable(playerType)

func getDuration(json:String):
	if (OS.get_name() == "Android") :
		return sdk.getDuration(json)
	
func selectPlayer(playerType: int) :
	if (OS.get_name() == "Android") :
		return sdk.selectPlayer(playerType)

func setTargetControllers(count = 1, index = [0]):
	if (OS.get_name() == "Windows") :
		sdk.setTargetControllers(count, index)
