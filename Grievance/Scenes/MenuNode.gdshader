shader_type canvas_item;
uniform float desatR = 0.0;
uniform float desatG = 0.0;
uniform float desatB = 0.0;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void vertex() {
	// Called for every vertex the material is visible on.
	
}

void fragment() {
	// Called for every pixel the material is visible on.
	// design from davetech.co.uk/shaderdesaturate
	
	// get current screen colour minus alpha
	vec3 c = textureLod(screen_texture,SCREEN_UV,0.0).rgb;
	// dot product to get greyscale value with magic vector based on human cone vision
	float desat = dot(c,vec3(0.2126, 0.7152, 0.0722));
	// calculate how desaturated the pixel should be. For example, if a pixel is
	// more red when desatR is 1.0, it is less desaturated.
	float r = (c.r-(c.g+c.b)/2.0) * desatR;
	float g = (c.g-(c.r+c.b)/2.0) * desatG;
	float b = (c.b-(c.g+c.r)/2.0) * desatB;
	// apply desaturated colour modified by uniform variables
	COLOR.rgb = mix(vec3(desat,desat,desat),c.rgb,max(max(r,g),b));
}	

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
