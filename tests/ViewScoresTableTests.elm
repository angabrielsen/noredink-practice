module ViewScoresTableTests exposing (viewScoresTableTests)

import Expect
import Test exposing (Test, test)
import ViewScoresTable exposing (averageGrade)

viewScoresTableTests =
    test "given two strings returns average as a string"
        (\_ -> Expect.equal "60" (averageGrade "60" "100"))