module ViewScoresTableTests exposing (..)

import Expect
import Test exposing (Test, test)
import ViewScoresTable exposing (averageGrade, averageClassGrade)

averageGradeTests =
    test "given two strings returns average as a string"
        (\_ -> Expect.equal "60" (averageGrade "60" "100"))

averageClassGradeTests =
    let
        class =
            [ { first_name = "Ashton"
            , last_name = "Gabrielsen"
            , possible_points = "100"
            , earned_points = "90"
            , test_title = "A Tale of Two Cities"
            , test_id = "1"
            }
            , { first_name = "James"
            , last_name = "Gabrielsen"
            , possible_points = "100"
            , earned_points = "80"
            , test_title = "A Tale of Two Cities"
            , test_id = "1"
            } ]
    in
    test "given two records returns grade average as a string"
            (\_ -> Expect.equal "85" (averageClassGrade class))