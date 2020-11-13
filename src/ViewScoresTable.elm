module ViewScoresTable exposing (viewScoresTable)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msg exposing (StudentRecord, Model)
import Round exposing (round)

viewScoresTable : Model -> Html msg
viewScoresTable model =
    if model.whichTest == "" then
        div []
            [ div [ class "jumbotron" ]
                [ h1 [] [ text "Choose a test from the list on the right" ] ]
            ]
    else
        let
            records =
                case model.whichTest of
                    "1" ->
                        List.filter (\record -> record.test_id == "1") model.mockData

                    "2" ->
                        List.filter (\record -> record.test_id == "2") model.mockData

                    "3" ->
                        List.filter (\record -> record.test_id == "3") model.mockData

                    _ ->
                        []


            testTitle =
                records
                    |> List.head
                    |> Maybe.withDefault {
                         first_name = ""
                         , last_name = ""
                         , possible_points = ""
                         , earned_points = ""
                         , test_title = ""
                         , test_id = ""
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
        classAverage =
            String.fromInt(
                (List.sum
                    (List.map
                        (\record ->
                            String.toInt(record.earned_points)
                               |> Maybe.withDefault 0) records))
                            //
                            (List.length records))
    in
    div []
        [ p [] [ text "Class average:"]
        , h1 [] [ text ( classAverage ++ "%") ] ]

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
            Round.round 0 (
                (( String.toFloat(record.earned_points)
                    |> Maybe.withDefault 0)
                /
                (String.toFloat(record.possible_points)
                    |> Maybe.withDefault 0))
                * 100 )
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