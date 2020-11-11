module HomePage exposing (main, Model)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import ScoresTable exposing (showScoresTable)

view model =
    div []
        [
        div [ class "jumbotron" ]
            [ h1 [] [ text "This will show test data!" ]
            , p [] [ text "But first, some CSV parsing" ]
            ]
        , div [] [
            p [] [ text "A description will go here." ]
        ]
        , showScoresTable model.mockData
        ]

main : Program String Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type alias Model = { mockData : String }

init : String -> ( Model, Cmd Msg )
init mockData =
    ( { mockData = mockData}
    , Cmd.none
    )

type Msg = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
        (model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none