precision mediump float;

attribute vec3 position;
uniform mat4 model, view, projection;
uniform vec3 ambient;

void main() {
  mat4 MVPmatrix = projection * view * model;
  gl_Position = MVPmatrix * vec4(position, 1);
}
