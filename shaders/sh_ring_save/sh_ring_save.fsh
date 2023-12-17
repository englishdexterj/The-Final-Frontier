varying vec2 v_vTexcoord;

uniform vec3 u_Color;
uniform float u_Time;
uniform float u_Frequency;
uniform float u_Amplitude;
uniform float u_RingAlpha; // New parameter for the ring's alpha

void main()
{
    // Sample the original color and alpha of the sprite
    vec4 originalColor = texture2D(gm_BaseTexture, v_vTexcoord);

    // Calculate the centered coordinates based on the sprite dimensions
    vec2 centeredCoords = v_vTexcoord - vec2(0.5, 0.5);
    float spriteWidth = 1.0;
    float spriteHeight = 1.0;

    // Adjust the distance calculation based on sprite dimensions
    float distance = length(centeredCoords / vec2(spriteWidth, spriteHeight));

    // Calculate the time-dependent factor
    float timeFactor = sin(u_Time * u_Frequency) * 0.5 + 0.5;

    // Calculate the ring effect with time modulation
    float ring = mod(distance - u_Time, u_Amplitude);

    // Create a see-through ring effect
    float transparency = 1.0 - smoothstep(u_Amplitude - 0.02, u_Amplitude, ring);

    // Adjust the blending factor to make the ring less prominent
    float blendFactor = 0.5; // Adjust this value to control the influence of the ring
    blendFactor *= transparency;

    // Set the pixel color with adjusted transparency, blending with the original alpha
    vec3 finalColor = mix(u_Color, originalColor.rgb, 1.0 - blendFactor);

    // Set the pixel color based on the blended result, with a modified alpha for the ring
    gl_FragColor = vec4(finalColor, originalColor.a * u_RingAlpha);
}