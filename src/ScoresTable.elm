module ScoresTable exposing (showScoresTable)

import Html exposing (..)
import Html.Attributes exposing (..)

showScoresTable =
    div []
        [ table [ id "class-scores" ]
            [ tr []
                [ td [] [ text "Ashton" ]
                  , td [] [ text "Gabrielsen" ]
                  , td [] [ text "100" ]
                  , td [] [ text "80" ]
                  , td [] [ text "80%" ]
                ]
            ]
        , div []
            [ text "mockdata" ]
        ]
