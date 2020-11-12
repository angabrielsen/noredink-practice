module Main exposing (main, Model, StudentRecord)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Round exposing (..)

view : Model -> Html Msg
view model =
    div []
        [ div [ class "test-chooser" ]
            [ viewTestChooser ]
        , div [ class "test-results"]
            [ showScoresTable model.mockData ]
        ]

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

viewTestChooser =
    table [ class "test-chooser-table" ]
        [ tr []
            [ th []
                [ text "Choose a Test" ]
            ]
        , tr []
            [ td []
                [ text "I'm a test" ]
            ]
        ,  tr []
            [ td []
                [ text "I'm a test" ]
            ]
        ,  tr []
            [ td []
                [ text "I'm a test" ]
            ]
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