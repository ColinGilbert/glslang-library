// texcoords
varying vec2 texcoord0;
varying vec2 texcoord1;

// samplers
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;


const float timestep = 0.75;
const float spacestep = 1.;
const float damping = 0.05;
const float wavespeed = 0.5;


// entry point
void main()
{   
	float timeSpaceFactor = (timestep*timestep)/(spacestep*spacestep);
	float dampFactor = 1.0 - damping*timestep;
   
	vec4 t_0 = texture2DRect(tex0, texcoord0);
	vec4 t_n1 = texture2DRect(tex1, texcoord1);
	
	float ds = spacestep;
	vec4 t00 = texture2DRect(tex0, texcoord0 + vec2(-ds, -ds));
	vec4 t10 = texture2DRect(tex0, texcoord0 + vec2(0., -ds));
	vec4 t20 = texture2DRect(tex0, texcoord0 + vec2(ds, -ds));
	
	vec4 t01 = texture2DRect(tex0, texcoord0 + vec2(-ds, 0.));
	vec4 t21 = texture2DRect(tex0, texcoord0 + vec2(ds, 0.));
	
	vec4 t02 = texture2DRect(tex0, texcoord0 + vec2(-ds, ds));
	vec4 t12 = texture2DRect(tex0, texcoord0 + vec2(0., ds));
	vec4 t22 = texture2DRect(tex0, texcoord0 + vec2(ds, ds));
	
	vec4 time = t_0 + dampFactor*(t_0 - t_n1);
	vec4 diag = 4.*t_0 - (t00 + t20 + t02 + t22);
	vec4 cross = 4.*t_0 - (t10 + t01 + t21 + t12);
	vec4 val = time - timeSpaceFactor*wavespeed*(cross + 0.5*diag);
	
	val = clamp(val, -1., 1.);

	gl_FragColor = val;
}