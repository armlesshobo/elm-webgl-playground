module Shaders exposing (..)

import Models exposing (Attribute, Uniform, Varying)
import WebGL exposing (Shader)
import Math.Vector3 exposing (vec3)
import Math.Vector4 exposing (vec4)


vertexShader : Shader Attribute Uniform Varying
vertexShader = [glsl|
  attribute vec3 position;
  attribute vec3 color;
  varying vec3 vColor;
  uniform mat4 rotation;
  void main () {
    gl_Position = rotation * vec4(position, 1.0);
    vColor = color;
  }
|]


fragmentShader : Shader {} Uniform Varying
fragmentShader = [glsl|
  precision mediump float;
  varying vec3 vColor;
  void main () {
    gl_FragColor = vec4(vColor, 1.0);
  }
|]
