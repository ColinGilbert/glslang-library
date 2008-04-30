uniform sampler2DRect tex0;

varying vec2 texcoord_p0;
varying vec2 texcoord_p1;
varying vec2 texcoord_p2;


void main()
{      
	vec3 p0 = texture2DRect(tex0, texcoord_p0).xyz;
	vec3 p1 = texture2DRect(tex0, texcoord_p1).xyz;
	vec3 p2 = texture2DRect(tex0, texcoord_p2).xyz;
	
	vec3 v1 = p1 - p0;
	vec3 v2 = p2 - p0;
	
	gl_FragColor.rgb = normalize( cross(v2, v1) );
	gl_FragColor.a = 1.;
}
