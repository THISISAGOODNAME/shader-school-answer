precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 fragNormal;

float goochWeight(vec3 normal, vec3 lightDirection) {
  return 0.5 * (1.0 + dot(normal, lightDirection));
}

vec3 goochColor(vec3 cool, vec3 warm, float weight) {
  return (1.0 - weight) * cool + weight * warm;
}

void main() {
  float gooch_weight = goochWeight(fragNormal, lightDirection);
  vec3 lightColor  = goochColor(cool, warm, gooch_weight);
  // vec3 lightColor = vec3(1.0, 1.0, 1.0);
  gl_FragColor = vec4(lightColor, 1);
}