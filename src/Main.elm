module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (Model, Msg, StudentRecord)
import ViewScoresTable exposing (viewScoresTable)
import ViewTestChooser exposing (viewTestChooser)


view : Model -> Html Msg
view model =
    div []
        [ div [ class "test-chooser" ]
            [ viewTestChooser ]
        , div [ class "test-results" ]
            [ viewScoresTable model ]
        ]


main : Program (List StudentRecord) Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : List StudentRecord -> ( Model, Cmd Msg )
init mockData =
    ( { mockData = mockData
      , whichTest = ""
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.WhichTest testId ->
            ( { model | whichTest = testId }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
