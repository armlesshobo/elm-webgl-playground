module Models exposing (Attribute, Uniform, Varying)

import Math.Vector3 exposing (Vec3)
import Math.Matrix4 exposing (Mat4)

type alias Attribute = {
  position : Vec3,
  color : Vec3
}

type alias Uniform = {
  rotation : Mat4
}

type alias Varying = {
  vColor : Vec3
}

type alias Camera = {
  position : Vec3
}
