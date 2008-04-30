varying vec2 texcoord0;
varying vec2 texdim1;

void main()
{
	gl_Position = ftransform();
    
	texcoord0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
	texdim1 = vec2(abs(gl_TextureMatrix[1][0][0]), 
					abs(gl_TextureMatrix[1][1][1]));
}