module Colors exposing (..)

import Models exposing (Color)
import Math.Vector3 exposing (Vec3, vec3)


blue : Color
blue =
    makeColor 0.0 0.0 1

darkBlue : Color
darkBlue =
    makeColor 0.0 0.3 0.5


makeColor : Float -> Float -> Float -> Color
makeColor r g b =
  vec3 r g b
