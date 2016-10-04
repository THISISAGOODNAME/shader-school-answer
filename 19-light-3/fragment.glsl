precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 fragNormal, fragPosition;

float phongWeight(
  vec3 lightDirection,
  vec3 surfaceNormal,
  vec3 eyeDirection,
  float shininess
) {
  //First reflect light by surface normal
  vec3 rlight = reflect(lightDirection, surfaceNormal);

  //Next find the projected length of the reflected
  //light vector in the view direction
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);

  //Finally exponentiate by the shininess factor
  return pow(eyeLight, shininess);
}

void main() {
  vec3 eyeDirection = normalize(fragPosition);
  vec3 normal = normalize(fragNormal);
  vec3 light = normalize(lightDirection);

  vec3 lightColor = ambient 
    + diffuse * max(dot(normalize(fragNormal), normalize(lightDirection)), 0.0) 
    + specular * phongWeight(light, normal, eyeDirection, shininess) ;
  gl_FragColor = vec4(lightColor, 1);
}