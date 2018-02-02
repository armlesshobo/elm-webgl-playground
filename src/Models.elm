module Models exposing (..)

import Math.Vector3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)

type alias Attribute = {
  position : Vec3,
  color : Vec3
}

type alias Uniform = {
  rotation : Mat4,
  camera : Camera
}

type alias Varying = {
  vColor : Vec3
}

type alias Camera = Mat4

type alias Color = Vec3

type alias Position = Vec3

type alias Direction = Vec3
