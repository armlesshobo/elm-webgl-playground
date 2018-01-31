import Html exposing (..)
import Html.Attributes exposing (style, height, width)

import WebGL
import Shaders exposing (vertexShader, fragmentShader)
import Meshes exposing (simpleTriangle)
import Math.Vector3 exposing (vec3, Vec3)
import Math.Matrix4 exposing (makeRotate)

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
    {}


initialModel : Model
initialModel =
    {}


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW

view : Model -> Html a
view angle =
  WebGL.toHtml
    [ width 300
    , height 300
    , style [("display", "block")]
    ]
    [ WebGL.entity
        vertexShader
        fragmentShader
        simpleTriangle
        { rotation = makeRotate 0 (vec3 0 1 0) }
    ]
