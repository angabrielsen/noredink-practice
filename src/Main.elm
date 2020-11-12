module Main exposing (main, Model, StudentRecord)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import ScoresTable exposing (showScoresTable)
import TestChooser exposing (viewTestChooser)

view : Model -> Html Msg
view model =
    div []
        [ div [ class "test-chooser" ]
            [ viewTestChooser ]
        , div [ class "test-results"]
            [ showScoresTable model.mockData ]
        ]

main : Program (List StudentRecord) Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type alias Model =
    { mockData : List StudentRecord
    , whichTest : String }


type alias StudentRecord =
    { first_name : String
    , last_name : String
    , possible_points : String
    , earned_points : String
    , test_title : String
    }

init : List StudentRecord -> ( Model, Cmd Msg )
init mockData =
    ( { mockData = mockData
      , whichTest = "" }
    , Cmd.none
    )

type Msg
    = WhichTest

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
        case msg of
            WhichTest ->
                ( { model | whichTest = "string" }, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none