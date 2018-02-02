module Models exposing (..)

import Math.Vector3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)

type alias Attribute = {
  position : Vec3,
  color : Vec3
}

type alias Uniform = {
  rotation : Mat4,
  camera : Mat4
}

type alias Varying = {
  vColor : Vec3
}

type alias Camera = {
  position : Position
}

type alias Color = Vec3

type alias Position = Vec3

type alias Direction = Vec3
