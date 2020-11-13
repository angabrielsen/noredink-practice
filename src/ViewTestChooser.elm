module ViewTestChooser exposing (viewTestChooser)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)


viewTestChooser =
    table [ class "test-chooser-table" ]
        [ tr []
            [ th []
                [ text "Choose a Test" ]
            ]
        , tr []
            [ td []
                [ a [ id "1", onClick (Msg.WhichTest "1") ]
                    [ text "A Tale of Two Cities" ]
                ]
            ]
        , tr []
            [ td []
                [ a [ id "2", onClick (Msg.WhichTest "2") ]
                    [ text "Harry Potter and the Chamber of Secrets" ]
                ]
            ]
        , tr []
            [ td []
                [ a [ id "3", onClick (Msg.WhichTest "3") ]
                    [ text "Moby Dick" ]
                ]
            ]
        ]
