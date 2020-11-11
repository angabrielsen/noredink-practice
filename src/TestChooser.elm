module TestChooser exposing (viewTestChooser)

import Html exposing (..)
import Html.Attributes exposing (..)

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