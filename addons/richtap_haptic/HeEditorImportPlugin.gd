@tool
extends EditorImportPlugin

class_name HeEditorImportPlugin
enum Presets {DEFAULT}
const RESOURCE_TYPE = "Resource"


func _get_importer_name():
	return "He"
	
func _get_recognized_extensions():
	return ["he"]
	
func _get_save_extension():
	return "tres"
	#
func _get_resource_type():
	print("EditorImportPlugin _get_resource_type")
	return RESOURCE_TYPE

func _get_import_options(path, preset_index):
	print("EditorImportPlugin load preset_index：", preset_index)
	match preset_index:
		Presets.DEFAULT:
			return [ {
					   "name": "use_red_anyway",
					   "default_value": false
					}]
		_:
			return []

func _get_visible_name():
	return "Resource"
	#
func _get_option_visibility(path, option_name, options):
	return false	

func _get_preset_count():
	return Presets.size()
func _get_preset_name(preset_index):
	match preset_index:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"
		
func _get_priority():
	return 1
func _get_import_order():
	return 0
	
func _import(source_file, save_path, options, platform_variants, gen_files):
	print("EditorImportPlugin import save_path：" + save_path + "，source_file:", source_file)
	var resource = HeResource.new()
	print("EditorImportPlugin resource", resource)
	var saveName = "%s.%s" % [save_path, _get_save_extension()]
	resource.load_forn_file(source_file, saveName)
	var e = ResourceSaver.save( resource,saveName, ResourceSaver.FLAG_CHANGE_PATH)
	gen_files.push_back(saveName)
	print("EditorImportPlugin save result：", e, saveName)
	return e
