#version 120
#extension GL_EXT_geometry_shader4 : enable

const mat4 basis = mat4(-1., 3., -3., 1., 
						3., -6., 3., 0., 
						-3., 0., 3., 0.,
						1., 4., 1., 0.);

void main(void)
{
	float t = 0;
	float dt = 1./10.;
	
	mat4 ctrl = mat4(gl_PositionIn[0], gl_PositionIn[1], gl_PositionIn[2], gl_PositionIn[3]);
	
	for(int i=0; i <= 10; i++) {
		float t2 = t*t;
		float t3 = t*t2;
		
		vec4 v = ctrl*basis*vec4(t3, t2, t, 1);
	
		gl_FrontColor = gl_FrontColorIn[0];
		gl_Position = gl_ProjectionMatrix*v;	
		EmitVertex();
		
		t += dt;
	}

	EndPrimitive();
}