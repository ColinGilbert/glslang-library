uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
	
varying vec2 texcoord0;
varying vec2 texdim1;

void main()
{      
	float val = texture2DRect(tex0, texcoord0).r;

	//scale [0, 1] color range to LUT dim range
	val *= texdim1.x;
	gl_FragColor.rgb = texture2DRect(tex1, vec2(val, 0.)).rrr;
	gl_FragColor.a = 1.;
}