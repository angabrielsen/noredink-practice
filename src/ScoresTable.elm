module ScoresTable exposing (showScoresTable)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias StudentRecord = {
    first_name : String
    , last_name : String
    , possible_points : String
    , earned_points : String
    }

showScoresTable : List StudentRecord -> Html msg
showScoresTable mockData =
    div []
        [ table []
            ([viewTableHeader] ++ List.map viewRecord mockData)
        ]

viewTableHeader : Html msg
viewTableHeader =
    tr []
        [ th []
            [ text "First Name" ]
        , th []
            [ text "Last Name" ]
        , th []
            [ text "Possible Points" ]
        , th []
            [ text "Earned Points" ]
        ]

viewRecord : StudentRecord -> Html msg
viewRecord post =
    tr []
        [ td []
            [ text post.first_name ]
        , td []
            [ text post.last_name ]
        , td []
            [ text post.possible_points ]
        , td []
            [ text post.earned_points ]
        ]
