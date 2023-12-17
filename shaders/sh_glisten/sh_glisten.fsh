// Glisten Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Uniforms
uniform float time;
uniform float alpha;
uniform float glisten_strength;

void main()
{
    // Sample the texture color
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);

    // Calculate glisten effect with multiple bars
    float barWidth = 0.05; // Adjust the width of the white bars
    float barFrequency = 10.0; // Adjust the frequency of the bars

    // Calculate glisten for a single bar
    float glisten = smoothstep(0.5 - barWidth / 2.0, 0.5 + barWidth / 2.0, fract(v_vTexcoord.x * barFrequency + time));

    // Blend the glisten effect with the original color
    vec3 glistenColor = texColor.rgb + 0.5 * glisten * glisten_strength;

    // Mix with the original texture color and set the overall alpha
    gl_FragColor = vec4(mix(texColor.rgb, glistenColor, alpha), alpha * texColor.a);
}