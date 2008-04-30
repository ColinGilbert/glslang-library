uniform sampler2DRect tex0;
varying vec2 texcoord0;

void main()
{
	vec4 c1 = texture2DRect(tex0, texcoord0);
	gl_FragColor = c1*gl_Color;
}