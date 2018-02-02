module Player exposing (..)

import Player.State exposing (PlayerState(..))
import Models exposing (Position, Attribute)
import WebGL exposing (Mesh)


type alias Player = {
  state : PlayerState,
  position : Position,
  direction : Direction,
  mesh : Mesh Attribute
}
