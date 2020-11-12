module ScoresTable exposing (showScoresTable, StudentRecord)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias StudentRecord = {
    first_name : String
    , last_name : String
    , possible_points : String
    , earned_points : String
    , test_title : String
    }

showScoresTable : List StudentRecord -> Html msg
showScoresTable records =
    let
        testTitle =
            records
                |> List.head
                |> Maybe.withDefault {
                     first_name = ""
                     , last_name = ""
                     , possible_points = ""
                     , earned_points = ""
                     , test_title = ""
                 }
                |> (\record -> record.test_title)
    in
    div []
        [ div [ class "jumbotron" ]
            [ h1 [] [ text testTitle ]
            , viewClassAverage records ]
        , div [ class "class-scores" ]
            [ table []
                ([viewTableHeader] ++ List.map viewRecord records)
                ]
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
viewRecord record =
    let
        average =
            String.fromFloat(
                ((String.toFloat(record.earned_points)
                    |> Maybe.withDefault 0)
                /
                (String.toFloat(record.possible_points)
                    |> Maybe.withDefault 0 )
                ) * 100 )
    in
    tr []
        [ td []
            [ text record.first_name ]
        , td []
            [ text record.last_name ]
        , td []
            [ text record.possible_points ]
        , td []
            [ text record.earned_points ]
        , td []
            [ text ( average ++ "%") ]
        ]
