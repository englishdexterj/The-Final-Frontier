varying vec2 v_vTexcoord;
uniform float u_time;

void main()
{
    // Calculate the distance from the center
    vec2 center = vec2(0.5, 0.5);
    float distance = length(v_vTexcoord - center);

    // Calculate the ring effect using sine and cosine functions with time-based movement
    float ringSize = 0.1; // Adjust this value to control the size of the rings
    float ringFrequency = 1.0; // Adjust this value to control the frequency of the rings
    float ringSpeed = 1.0; // Adjust this value to control the speed of the rings

    float ringEffect = 0.5 + 0.5 * sin((distance * 6.2831 * ringFrequency - u_time * ringSpeed));

    // Apply the ring effect to the color
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
    color.rgb *= ringEffect;

    gl_FragColor = color;
}