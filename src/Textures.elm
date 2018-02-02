module Textures exposing (..)

import WebGL.Texture as T exposing (Texture)

mudkip : Task Error Texture
mudkip =
    T.load "mudkip.png"
