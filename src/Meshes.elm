module Meshes exposing (..)

import Models exposing (Attribute, Color)
import WebGL exposing (entity, Mesh)
import Math.Vector3 exposing (vec3)


simpleTriangle : Mesh Attribute
simpleTriangle =
  WebGL.triangles
      [ ( Attribute (vec3 0 0.5 0)   (vec3 0.5 0 0)
        , Attribute (vec3 -0.5 -0.5 0) (vec3 0 0.5 0)
        , Attribute (vec3 0.5 -0.5 0)  (vec3 0 0 0.5)
        )
      ]


surface : Color -> Mesh Attribute
surface color =
  WebGL.triangles
    [
      ( Attribute (vec3 -10.0 -1.0 10.0) color, Attribute (vec3 10.0 -1.0  10.0) color, Attribute (vec3  -10.0 -1.0 -10.0) color)
    , ( Attribute (vec3  10.0 -1.0 10.0) color, Attribute (vec3 10.0 -1.0 -10.0) color, Attribute (vec3 -10.0 -1.0 -10.0) color)
    ]
