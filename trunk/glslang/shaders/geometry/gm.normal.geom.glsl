#version 120
#extension GL_EXT_geometry_shader4 : enable

uniform float scale;
uniform vec4 c1;
uniform vec4 c2;

varying in vec4 P[3];
varying in vec3 N[3];


vec4 add_normal(vec4 p, vec3 n)
{
	vec4 t = p;
	t.xyz += n.xyz*scale;
	return t;
}


void main(void)
{
//--------------------------------------------------------------------------
	gl_FrontColor = c1;
	gl_Position = gl_ProjectionMatrix*P[0];
	EmitVertex();
	
	gl_FrontColor = c2;
	gl_Position = gl_ProjectionMatrix*add_normal(P[0], N[0]);
	EmitVertex();	
		EndPrimitive();
//--------------------------------------------------------------------------
	gl_FrontColor = c1;
	gl_Position = gl_ProjectionMatrix*P[1];
	EmitVertex();
	
	gl_FrontColor = c2;
	gl_Position = gl_ProjectionMatrix*add_normal(P[1], N[1]);
	EmitVertex();	
		EndPrimitive();
//--------------------------------------------------------------------------		
	gl_FrontColor = c1;
	gl_Position = gl_ProjectionMatrix*P[2];
	EmitVertex();
	
	gl_FrontColor = c2;
	gl_Position = gl_ProjectionMatrix*add_normal(P[2], N[2]);
	EmitVertex();	
		EndPrimitive();
//--------------------------------------------------------------------------
}