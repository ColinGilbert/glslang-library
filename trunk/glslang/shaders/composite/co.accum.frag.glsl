// texcoords
varying vec2 texcoord0;
varying vec2 texcoord1;

// samplers
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

// accum amount
uniform vec4 erase_color;

const float eps = 0.012;


void main()
{      
	vec4 current = texture2DRect(tex0, texcoord0);
	vec4 previous = texture2DRect(tex1, texcoord1);

	//simulation of jit.gl.render's @erase_color attribute
	vec4 framebuffer = mix(previous, erase_color, erase_color.a);
	
	gl_FragColor = framebuffer + current;
}