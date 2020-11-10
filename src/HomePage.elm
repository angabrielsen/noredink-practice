module HomePage exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

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
        , table [ id "class-scores" ] [
            tr [] [
                td [] [ text "Ashton" ]
                , td [] [ text "Gabrielsen" ]
                , td [] [ text "100" ]
                , td [] [ text "80" ]
                , td [] [ text "80%" ]
            ]
        ]
    ]

main =
    view "dummy model"
