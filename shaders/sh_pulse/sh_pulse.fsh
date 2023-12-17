varying vec2 v_vTexcoord;

uniform vec3 u_Color;
uniform float u_Time;
uniform float u_Frequency;
uniform float u_Amplitude;

void main()
{
    // Sample the original color and alpha of the sprite
    vec4 originalColor = texture2D(gm_BaseTexture, v_vTexcoord);

    // Calculate the distance from the center of the sprite
    float distance = length(v_vTexcoord - vec2(0.5, 0.5));

    // Calculate the time-dependent factor
    float timeFactor = sin(u_Time * u_Frequency) * 0.5 + 0.5;

    // Calculate the ring effect with time modulation
    float ring = u_Amplitude * (1.0 + timeFactor);

    // Create a see-through ring effect
    float transparency = 1.0 - smoothstep(ring - 0.02, ring, distance);

    // Set the pixel color with transparency, blending with the original alpha
    vec3 finalColor = mix(u_Color, originalColor.rgb, transparency);

    // Set the pixel color based on the blended result, keeping the original alpha
    gl_FragColor = vec4(finalColor, originalColor.a);
}