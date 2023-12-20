

void mainImage(out vec4 fragColor,in vec2 fragCoord)
{
  // Rescale & center to ([-1, 1], [-1, 1]), fit to a square in the center if rect aspect ratio
  
  vec2 uv=(fragCoord*2.)/iResolution.y-iResolution.xy/iResolution.y;
  
  //vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
  vec2 uv0=uv;
  
  //
  
  // Normalized pixel coordinates (from 0 to 1)
  //vec2 uv = fragCoord/iResolution.xy;
  
  // Time varying pixel color
  //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));
  
  float iTime_s=iTime*.8;
  
  vec3 rainbow1=.33*cos(iTime_s+uv.yxx+vec3(0,2,4));
  
  vec3 rainbow2=.25*cos(iTime_s*.7+-uv.xyx*.78+vec3(3,13,22));
  
  vec3 rainbow3=.33*cos(pow(iTime_s,1.1)*.25+uv.xyy*1.25+vec3(-3,5,6));
  
  vec3 rainbow4=.25*sin(pow(iTime_s,.9)*.45+uv.yxy*1.45+vec3(-2,4,8));
  
  vec3 rainbow5=-.2*cos(iTime_s+uv.yxy*1.45+vec3(0,0,0));
  
  //vec3 col = rainbow1;
  //vec3 col = rainbow2;
  //vec3 col = rainbow3;
  vec3 col=rainbow1+rainbow2+rainbow3+rainbow4+rainbow5;
  //vec3 col = vec3(iTime / 100., iTime_s / 1000., iTime_s / 1000.);
  
  // Output to screen
  fragColor=vec4(col,1.);
}

