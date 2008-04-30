#define OFFSET  gl_Vertex
#define CENTER	gl_Normal

uniform float scale;

varying vec2 texcoord0;

void main()
{
	//screen-aligned axes
	vec3 axis1 = vec3(	gl_ModelViewMatrix[0][0], 
						gl_ModelViewMatrix[1][0],
						gl_ModelViewMatrix[2][0]);
						
	vec3 axis2 = vec3(	gl_ModelViewMatrix[0][1], 
						gl_ModelViewMatrix[1][1],
						gl_ModelViewMatrix[2][1]);


	//offset from center point
	vec3 corner = (OFFSET.x*axis1 + OFFSET.y*axis2)*scale + CENTER;
	
	// position in eye space
	gl_Position = gl_ModelViewProjectionMatrix * vec4(corner, 1.);

	texcoord0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
	gl_FrontColor = gl_Color;
}