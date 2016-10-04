precision mediump float;

// uniform mat4 model;
// uniform mat4 view;
// uniform mat4 projection;

// uniform mat4 inverseModel;
// uniform mat4 inverseView;
// uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 fragNormal;

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

void main() {
  // vec3 lightColor = ambient + diffuse * max(dot(normalize(fragNormal), normalize(lightDirection)), 0.0);
  vec3 lightColor = ambient + diffuse * lambertWeight(normalize(fragNormal), normalize(lightDirection));

  gl_FragColor = vec4(lightColor, 1);
}