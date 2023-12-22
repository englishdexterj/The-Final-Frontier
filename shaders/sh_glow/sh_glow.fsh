// Fragment shader
varying vec2 v_vTexcoord;
//uniform sampler2D gm_BaseTexture;
uniform vec2 resolution;

void main()
{
    vec2 uv = v_vTexcoord;
    float glowStrength = 0.05;
    float blurRadius = 0.01;
    vec2 blurOffset = vec2(blurRadius / resolution.x, blurRadius / resolution.y);

    vec4 sum = vec4(0.0);

    for (float i = -4.0; i <= 4.0; i++) {
        sum += texture2D(gm_BaseTexture, uv + i * blurOffset) * 0.05;
    }

    vec4 finalColor = texture2D(gm_BaseTexture, uv) + glowStrength * sum;
    gl_FragColor = finalColor;
}