uniform float eps;

varying vec2 texcoord_p0;
varying vec2 texcoord_p1;
varying vec2 texcoord_p2;

void main()
{
	// perform standard transform on vertex
	gl_Position = ftransform();
    
	// transform texcoords
	texcoord_p0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
	
	texcoord_p1 = texcoord_p0;
	texcoord_p1.x += eps;
	
	texcoord_p2 = texcoord_p0;
	texcoord_p2.y += eps;
}
