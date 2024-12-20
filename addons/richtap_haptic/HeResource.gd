@tool
extends Resource

class_name HeResource
@export var _heContent: String

func getHeContent():
	return _heContent

func load_forn_file(p_path, saveName):
	print("HeResource load_forn_file: p_path" + p_path)
	resource_name = get_file_name(p_path)
	resource_path = saveName
	read_file_content(p_path) 

func get_file_name(file_path: String):
	var file_name = file_path.get_file()
	return file_name

func read_file_content(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file == null:
		push_error("Unable to open file：" + file_path)
		return ""
	_heContent = file.get_as_text()
	
func get_property_list() -> Array:
	var properties = []
	return properties
