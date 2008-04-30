uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
	
varying vec2 texcoord0;
varying vec2 texdim1;

void main()
{      
	vec4 c = texture2DRect(tex0, texcoord0);

	//scale [0, 1] color range to LUT dim range
	c *= texdim1.x;
	gl_FragColor.r = texture2DRect(tex1, vec2(c.r, 0.)).r;
	gl_FragColor.g = texture2DRect(tex1, vec2(c.g, 0.)).g;
	gl_FragColor.b = texture2DRect(tex1, vec2(c.b, 0.)).b;
	gl_FragColor.a = texture2DRect(tex1, vec2(c.a, 0.)).a;
}