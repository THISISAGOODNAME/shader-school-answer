precision highp float;

varying vec3 pointColor;

void main() {
  if(distance(gl_PointCoord.st, vec2(0.5,0.5)) > 0.5) {
    discard;
  }
  gl_FragColor = vec4(pointColor,1);
}