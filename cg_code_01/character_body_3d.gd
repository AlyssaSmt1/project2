extends CharacterBody3D

const MOVE_SPEED := 500.0
const ROTATE_SPEED := 2.5

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	)

	if input_vector.length() > 0:
		# Rotation (Links/Rechts)
		rotation.y -= input_vector.x * ROTATE_SPEED * delta

		# Vorwärts-/Rückwärtsbewegung (Z-Achse)
		var forward = transform.basis.z.normalized()
		var move_velocity = forward * input_vector.y * MOVE_SPEED

		# Behalte vertikale Geschwindigkeit (z. B. Gravitation)
		velocity.x = move_velocity.x
		velocity.z = move_velocity.z
	else:
		velocity.x = 0
		velocity.z = 0

	move_and_slide()
