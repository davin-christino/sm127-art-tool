@tool
class_name Generator extends Control
## Generates the art code based from its ColorRect children and grandchildren

## Object properties for lava art.
@export var lava_attributes: LavaAttributes
@export_tool_button("Copy lava art code") var code_button = copy_code

## Gets all the ColorRect nodes from the node's children and grandchildren.
func get_all_color_rect_children(node) -> Array[ColorRect]:
	var nodes: Array[ColorRect] = []
	
	# Recursively add children nodes to array
	for N in node.get_children():
		# Add only if node is ColorRect:
		if N is ColorRect and (N as ColorRect).is_visible_in_tree(): 
			nodes.append(N)
		
		if N.get_child_count() > 0:
			# Call recursively
			nodes.append_array(get_all_color_rect_children(N))
	return nodes

## Copies the objects code to the device clipboard.
func copy_code():
	# Get all ColorRects in the scene
	var color_rects: Array[ColorRect] = get_all_color_rect_children(self)
	
	# Get the code of each ColorRect object
	var code := ""
	for color_rect in color_rects:
		code += lava_code_from_color_rect(color_rect)
	
	# Copy the code to the device clipboard
	DisplayServer.clipboard_set(code)
	print("Copied! %d objects, %d characters" % [len(color_rects), len(code)])

func lava_code_from_color_rect(color_rect: ColorRect) -> String:
	# Color of the object
	var color := color_rect.color * Color(255.0/72, 255.0/72, 255.0/72, 1)
	# Position of the object
	var position := color_rect.global_position
	# Rotation of the object
	var rotation := rad_to_deg(color_rect.get_global_transform().get_rotation())
	# Size (width and height) of the object
	var size := color_rect.get_global_rect().size * Vector2(1, 100000)
	# Scale of the object
	var scale := "V21x0.00001"
	
	# If size.y is scaled negatively, rotate by 180 degrees and negatively scale scale.x instead.
	# (size.x is always positive)
	if size.y < 0:
		rotation += 180
		size.y *= -1
		scale = "V2-1x0.00001"
	
	return "|75,0,V2{px}x{py},{scale},FL{r},BL{enabled},BL{visible},FL{width},FL{height},CL{cr}x{cg}x{cb}x{ca},BL{infront},ST{tag},BL{tapmode}".format(
		{
			"px": snappedf(position.x, 0.1),
			"py": snappedf(position.y, 0.1),
			"scale": scale,
			"r": snappedf(rotation, 0.01),
			"enabled": int(lava_attributes.enabled),
			"visible": int(lava_attributes.visible),
			"width": snappedf(size.x, 0.1),
			"height": roundi(size.y),
			"cr": snappedf(color.r, 0.001),
			"cg": snappedf(color.g, 0.001),
			"cb": snappedf(color.b, 0.001),
			"ca": snappedf(color.a, 0.001),
			"infront": int(lava_attributes.render_in_front),
			"tag": lava_attributes.tag,
			"tapmode": lava_attributes.tap_mode,
		}
	)
