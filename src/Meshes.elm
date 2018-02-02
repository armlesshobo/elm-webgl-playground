module Meshes exposing (..)

import Models exposing (Attribute, Color)
import WebGL exposing (entity, Mesh)
import Math.Vector3 exposing (vec3)


simpleTestTriangle : Mesh Attribute
simpleTestTriangle =
  simpleTriangle3 (vec3 0.5 0 0) (vec3 0 0.5 0) (vec3 0 0 0.5)

simpleTriangle : Color -> Mesh Attribute
simpleTriangle color =
  simpleTriangle3 color color color

simpleTriangle3 : Color -> Color -> Color -> Mesh Attribute
simpleTriangle3 color1 color2 color3 =
  WebGL.triangles
      [ ( Attribute (vec3    0  0.5 0) color1
        , Attribute (vec3 -0.5 -0.5 0) color2
        , Attribute (vec3  0.5 -0.5 0) color3
        )
      ]

surface : Color -> Mesh Attribute
surface color =
  WebGL.triangles
    [
      ( Attribute (vec3 -10.0 -1.0 10.0) color, Attribute (vec3 10.0 -1.0  10.0) color, Attribute (vec3  -10.0 -1.0 -10.0) color)
    , ( Attribute (vec3  10.0 -1.0 10.0) color, Attribute (vec3 10.0 -1.0 -10.0) color, Attribute (vec3 -10.0 -1.0 -10.0) color)
    ]
