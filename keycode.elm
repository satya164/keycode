module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard exposing (KeyCode, downs)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { keyCode : KeyCode }


init : ( Model, Cmd Msg )
init =
    ( Model 0, Cmd.none )


type Msg
    = Keydown KeyCode


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Keydown code ->
            ( Model code, Cmd.none )


subscriptions : a -> Sub Msg
subscriptions model =
    downs Keydown


view : Model -> Html a
view model =
    let
        label =
            if model.keyCode == 0 then
                "Press a key"
            else
                toString model.keyCode
    in
        div
            [ style
                [ ( "display", "table" )
                , ( "table-layout", "fixed" )
                , ( "height", "100vh" )
                , ( "width", "100vw" )
                , ( "background-color", "#f07d4c" )
                , ( "color", "#fff" )
                ]
            ]
            [ div
                [ style
                    [ ( "display", "table-cell" )
                    , ( "vertical-align", "middle" )
                    , ( "text-align", "center" )
                    , ( "font-family", "'Open Sans', 'Roboto Regular', Candara, Calibri, Segoe, 'Segoe UI', Optima, Arial, sans-serif" )
                    , ( "font-size", "4em" )
                    ]
                ]
                [ text label
                ]
            ]
