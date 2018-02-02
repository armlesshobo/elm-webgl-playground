module Msgs exposing (..)

import Keyboard
import Mouse
import Time exposing (Time)


type Msg = OnKeyDown Keyboard.KeyCode
         | OnMouseClick Mouse.Position
         | OnMilliTick Time
