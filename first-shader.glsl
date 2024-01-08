float sdBox(in vec2 p,in vec2 b)
{
    vec2 d=abs(p)-b;
    return length(max(d,0.))+min(max(d.x,d.y),0.);
}


void mainImage(out vec4 fragColor,in vec2 fragCoord){
    // vec3 color1=vec3(1.,0.,1.);
    // vec3 color2=vec3(1.,1.,0.);
    // vec3 color3=vec3(0.,0.,1.);
    // vec3 color4=vec3(1.,0.,0.);
    // if(fragCoord.x<iResolution.x*.25){
    //   fragColor=vec4(color1,1.);
    // } else if (fragCoord.x >= iResolution.x*.25 && fragCoord.x < iResolution.x * .5) {
    //   fragColor = vec4(color2, 1);
    // } else if (fragCoord.x >= iResolution.x * .5 && fragCoord.x < iResolution.x * .75) {
    //   fragColor = vec4(color3, 1);
    // } else if (fragCoord.x >= iResolution.x * .75) {
    //   fragColor = vec4(color4, 1);
    // }
    vec2 uv = fragCoord / iResolution.xy;
    uv = (uv - 0.5) * 2.0;
    uv.x *= iResolution.x / iResolution.y;
    // float d = length(uv);
    // d -= 0.5;
    // 发光
    // float c = .25 / d;
    // c = pow(c, 1.6);
    // float c = step(0., d);
    // float c = smoothstep(0.,.02,d);
    // fragColor=vec4(vec3(c),1.);

    // 长方形
    float d=sdBox(uv,vec2(.6,.3));
    float c=smoothstep(0.,.02,d);
    fragColor=vec4(vec3(c),1.);
}
