module Msg exposing (Model, Msg(..), StudentRecord)


type alias Model =
    { mockData : List StudentRecord
    , whichTest : String
    }


type Msg
    = WhichTest String


type alias StudentRecord =
    { first_name : String
    , last_name : String
    , possible_points : String
    , earned_points : String
    , test_title : String
    , test_id : String
    }
