module Test.Generated.Main636099010 exposing (main)

import ViewScoresTableTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "ViewScoresTableTests" [ViewScoresTableTests.averageClassGradeTests,
    ViewScoresTableTests.averageGradeTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 122199939564962, processes = 8, globs = [], paths = ["/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/ViewScoresTableTests.elm"]}