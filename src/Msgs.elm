module Msgs exposing (..)

import Keyboard
import Mouse


type Msg = OnKeyDown Keyboard.KeyCode
         | OnMouseClick Mouse.Position
