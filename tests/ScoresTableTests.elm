module ScoresTableTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)


scoreCalculatorTests =
    describe    "scoreCalculatorTests"
        [ test "a test that tests something" <|
            \_ ->
                Expect.equal 4 (2 + 2)
        ]
