module Test.Generated.Main2474749939 exposing (main)

import ViewScoresTableTests
import Example

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "ViewScoresTableTests" [ViewScoresTableTests.viewScoresTableTests],     Test.describe "Example" [Example.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 320609885083099, processes = 8, globs = [], paths = ["/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/Example.elm","/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/ViewScoresTableTests.elm"]}