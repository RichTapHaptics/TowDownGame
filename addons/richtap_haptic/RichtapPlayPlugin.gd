@tool
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var android_export_plugin : AndroidExportPlugin
var heEditorImportPlugin
func _enter_tree():
	print("EditorPlugin _enter_tree",OS.get_name())
	# Initialization of the plugin goes here.
	android_export_plugin = AndroidExportPlugin.new()
	add_export_plugin(android_export_plugin)
	add_autoload_singleton("RichtapSdk", "res://addons/richtap_haptic/RichtapSdk.gd")
	add_custom_type("RichtapPlayer2D", "Node2D",
		load("res://addons/richtap_haptic/RichtapPlayer.gd"), null)
	heEditorImportPlugin = preload("res://addons/richtap_haptic/HeEditorImportPlugin.gd").new()
	add_import_plugin(heEditorImportPlugin)


func _exit_tree():
	print("EditorPlugin _get_android_libraries")
	# Clean-up of the plugin goes here.
	remove_custom_type("RichtapPlayer")
	remove_import_plugin(heEditorImportPlugin)
	remove_autoload_singleton("RichTapSdk")
	remove_export_plugin(android_export_plugin)
	android_export_plugin = null


class AndroidExportPlugin extends EditorExportPlugin:
	# TODO: Update to your plugin's name.
	var _plugin_name = "RichTapHapticAndroidPlugin"
	var _plugin_dir = "richtap_haptic/bin/"

	func _supports_platform(platform):
		#print("_supports_platform",platform is EditorExportPlatformAndroid)
		if platform is EditorExportPlatformAndroid:
			return true
		return false

	func _get_android_libraries(platform, debug):
		print("_get_android_libraries",platform,debug)
		#return PackedStringArray([_plugin_dir + _plugin_name + "-debug.aar" ,_plugin_dir + "haptic-release.aar"])
		if debug:
			return PackedStringArray([_plugin_dir + _plugin_name + "-debug.aar" ,_plugin_dir + "haptic-release.aar"])
		else:
			return PackedStringArray([_plugin_dir + _plugin_name + "-release.aar" ,_plugin_dir + "haptic-release.aar"])

	func _get_android_dependencies(platform, debug):
		# TODO: Add remote dependices here.
		if debug:
			return PackedStringArray([])
		else:
			return PackedStringArray([])

	func _get_name():
		print("_get_name: " , _plugin_name)
		return _plugin_name
