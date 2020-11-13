module Test.Generated.Main139647744 exposing (main)

import ViewScoresTableTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "ViewScoresTableTests" [ViewScoresTableTests.viewScoresTableTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 206033899281871, processes = 8, globs = [], paths = ["/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/ViewScoresTableTests.elm"]}