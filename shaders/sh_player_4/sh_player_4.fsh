//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 texColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 finalColor = mix(vec4(1.0, 1.0, 0.0, 1.0), texColor, 0.5);
	gl_FragColor = finalColor;
}
