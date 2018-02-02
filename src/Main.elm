import Html exposing (..)
import Html.Attributes exposing (style, height, width)

import WebGL
import Shaders exposing (vertexShader, fragmentShader)
import Meshes exposing (simpleTestTriangle, surface)
import Math.Vector3 exposing (vec3, Vec3)
import Math.Matrix4 as Mat4 exposing (Mat4, makeRotate, makePerspective)
import Models exposing (Camera)

import Colors

import Msgs exposing (Msg)

import Keyboard
import Mouse
import Time exposing (Time)

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { rotation : Float
    , cameraRotation : Float
    , camera : Camera
    }


initialModel : Model
initialModel =
    { rotation = 0
    , cameraRotation = 0
    , camera = camera
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnKeyDown keycode ->
          let
              updatedModel = processKeyCode keycode model
          in
            ( updatedModel, Cmd.none )

        Msgs.OnMouseClick position ->
            ( model, Cmd.none )

        Msgs.OnMilliTick time ->
            ( {model | rotation = model.rotation + 0.1}, Cmd.none )

        Msgs.TurnCamera time ->
            let
                newRotation = model.cameraRotation + 0.01
                newCamera = Mat4.mul (cameraRotate newRotation) model.camera
            in
                ( {model | camera = newCamera, cameraRotation = newRotation}, Cmd.none )


processKeyCode : Keyboard.KeyCode -> Model -> Model
processKeyCode keycode model =
  let
      code = Debug.log "Key pressed: " keycode

      newRotation =
        case keycode of
          37 ->
            -0.01 + model.cameraRotation

          39 ->
            0.01 + model.cameraRotation

          _ ->
            model.rotation

  in
    {model | cameraRotation = newRotation}


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Keyboard.downs Msgs.OnKeyDown
              , Mouse.clicks Msgs.OnMouseClick
              , Time.every 10 Msgs.OnMilliTick
              , Time.every 100 Msgs.TurnCamera
              ]

-- VIEW

persProj : Mat4
persProj =
    Mat4.makePerspective 90 (4/3) 0.1 100

cameraLookAt : Mat4
cameraLookAt =
    Mat4.makeLookAt
      (vec3 0.0 1.0 1.0)
      (vec3 0.0 0.0 0.0)
      (vec3 0.0 1.0 0.0)

camera : Camera
camera =
    Mat4.mul persProj cameraLookAt

cameraRotate : Float -> Mat4
cameraRotate rotation =
    makeRotate rotation (vec3 0 1 0)


view : Model -> Html a
view model =
      WebGL.toHtml
        [ width 1000
        , height 800
        , style [("display", "block")]
        ]
        [ WebGL.entity
            vertexShader
            fragmentShader
            simpleTestTriangle
            { rotation = makeRotate model.rotation (vec3 0 1 0)
            , camera = model.camera
            }

        , WebGL.entity
              vertexShader
              fragmentShader
              (surface Colors.darkBlue)
              { rotation = Mat4.identity
              , camera = model.camera
              }
        ]
