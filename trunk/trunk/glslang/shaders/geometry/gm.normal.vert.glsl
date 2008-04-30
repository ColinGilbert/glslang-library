#version 120

varying vec4 P;
varying vec3 N;

void main(void)
{
	//get the vertices into eye space
	P = gl_ModelViewMatrix*gl_Vertex;
	
	//just send the things as they are
	gl_Position = gl_Vertex;
	gl_FrontColor = gl_Color;
	
	//get normals into eye space
	N = gl_NormalMatrix*gl_Normal;
}