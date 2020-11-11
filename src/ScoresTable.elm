module ScoresTable exposing (showScoresTable, viewClassAverage)

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
    div [ class "class-scores" ]
        [ table []
            ([viewTableHeader] ++ List.map viewRecord mockData)
        ]

viewClassAverage : List StudentRecord -> Html msg
viewClassAverage records =
    let
        allEarnedPoints =
            List.sum (List.map (\record -> String.toInt(record.earned_points) |> Maybe.withDefault 0) records)

        classAverage =
            allEarnedPoints // (List.length records)
    in
    div []
        [ p [] [ text "Class average:"]
        , h1 [] [ text ((String.fromInt(classAverage)) ++ "%") ] ]

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
        , th []
            [ text "Average" ]
        ]

viewRecord : StudentRecord -> Html msg
viewRecord records =
    let
        earned_points =
            toFloat((String.toInt(records.earned_points) |> Maybe.withDefault 0))

        possible_points =
            toFloat((String.toInt(records.possible_points) |> Maybe.withDefault 0))

        average =
            String.fromFloat((earned_points / possible_points) * 100)
    in
    tr []
        [ td []
            [ text records.first_name ]
        , td []
            [ text records.last_name ]
        , td []
            [ text records.possible_points ]
        , td []
            [ text records.earned_points ]
        , td []
            [ text (average ++ "%") ]
        ]
