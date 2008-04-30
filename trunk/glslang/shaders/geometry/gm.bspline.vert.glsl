#version 120

void main(void)
{
	gl_Position = gl_ModelViewMatrix*gl_Vertex;
	gl_FrontColor = gl_Color;
}