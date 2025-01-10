@tool
extends Node
var sdk:BaseRichTapPlatformSdk

func _ready():
	print("RichTapSdk _ready platform:",OS.get_name())
	if (OS.get_name() == "Android") :
		sdk = RichTapAndroidSdk.new()
	elif(OS.get_name() == "iOS") :
		sdk = RichTapIOSSdk.new()
	else: 
		sdk = RichTapWindowSdk.new()
	sdk.initHaptic()
	
func openLog(enable:bool):
	sdk.enableDebug(enable)

func playHaptic(he: String, loopCount: int = 0, interval: int = 0, amplitude: int = 255, freq: int = 0): 
	print("RichTapSdk playHaptic amplitude:",amplitude)
	if (sdk != null) :
		return sdk.playHaptic(he,loopCount,interval,amplitude,freq)
	
func stopHaptic(playId = null):
	if (sdk is RichTapIOSSdk) :
		if (playId != null):
			sdk.stopHapticById(playId)
		else:
			sdk.stopHaptic()
	else :	
		sdk.stopHaptic()
	
func playExtPrebaked(prebakedId: int, strength: int):
	if (sdk != null) :
		sdk.playExtPrebaked(prebakedId,strength)
	
func setGain(gain: int ,playId:int) :
	if (sdk is RichTapIOSSdk) :
		sdk.setIosGain(gain,playId)
	
func getSdkVersion() :
	return sdk.getSdkVersion()
	
func isSupportedRichTap() :
	if (sdk is RichTapAndroidSdk || sdk is RichTapIOSSdk) :
		return sdk.isSupportedRichTap()

func getCoreVersion() :
	if (sdk is RichTapAndroidSdk) :
		return sdk.getCoreVersion()
	
func isPlayerTypeAvailable(playerType:int) :
	if (sdk is RichTapAndroidSdk) :
		return sdk.isPlayerTypeAvailable(playerType)

func getDuration(json:String):
	if (sdk is RichTapAndroidSdk || sdk is RichTapIOSSdk) :
		return sdk.getDuration(json)
	
func selectPlayer(playerType: int) :
	if (sdk is RichTapAndroidSdk) :
		return sdk.selectPlayer(playerType)

func setTargetControllers(index = [0]):
	if (sdk is RichTapWindowSdk) :
		sdk.setTargetControllers(index)
