shader_type canvas_item;

uniform bool damaged = false;

void vertex() {
	VERTEX.y *= sin(TIME * 10.0) * 0.1 + 1.2;
}

void fragment() {
    if (damaged) {
        vec4 tex = texture(TEXTURE, UV);
        COLOR = vec4(1.0, 1.0, 1.0, tex.a);
    }
}
