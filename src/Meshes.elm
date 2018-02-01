module Meshes exposing (..)

import Models exposing (Attribute)
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
