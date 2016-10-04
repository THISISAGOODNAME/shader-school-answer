precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  //TODO: Apply the model-view-projection matrix to `position`

  mat4 MVPmatrix = projection * view * model;
  gl_Position = MVPmatrix * vec4(position, 1);
}