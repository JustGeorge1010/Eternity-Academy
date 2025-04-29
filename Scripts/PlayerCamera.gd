extends Camera3D
class_name PlayerCamera

@export var LookSpeed = 0.005

var player : Node3D
var rot_x = 0
var rot_y = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player = get_tree().get_first_node_in_group("Player")
	
func _process(_delta: float) -> void:
	# Reset rotation
	transform.basis = Basis() 
	player.transform.basis = Basis()	
		
	player.rotate_object_local(Vector3(0, 1, 0), rot_x) # Rotate player around y
	rotate_object_local(Vector3(1, 0, 0), rot_y) # Then rotate camera around X
	
func _input(event):
	if event is InputEventMouseMotion:
		# Modify accumulated mouse rotation
		rot_x += -event.relative.x * LookSpeed
		rot_y += -event.relative.y * LookSpeed
		
		# Cap Y Rotation
		if rot_y > 1.39626:
			rot_y = 1.39626
		elif rot_y < -1.39626:
			rot_y = -1.39626
