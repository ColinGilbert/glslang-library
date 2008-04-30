uniform float xfade;

// texcoords
varying vec2 texcoord0;
varying vec2 texcoord1;

// samplers
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;


// entry point
void main()
{      
	vec4 c1 = texture2DRect(tex0, texcoord0);
	vec4 c2 = texture2DRect(tex1, texcoord1);

	gl_FragColor = mix(c1, c2, xfade);
}
