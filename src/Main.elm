module Main exposing (main, Model)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import ScoresTable exposing (showScoresTable, viewClassAverage)

view : Model -> Html Msg
view model =
    div []
        [ div [ class "test-chooser" ]
            [ p [] [ text "Choose a test" ] ]
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

type alias Model = { mockData : List StudentRecord }
type alias StudentRecord = {
    first_name : String
    , last_name : String
    , possible_points : String
    , earned_points : String
    }

init : List StudentRecord -> ( Model, Cmd Msg )
init mockData =
    ( { mockData = mockData }
    , Cmd.none
    )

type Msg = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
        (model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none