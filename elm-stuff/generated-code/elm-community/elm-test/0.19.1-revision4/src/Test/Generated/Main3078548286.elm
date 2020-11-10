module Test.Generated.Main3078548286 exposing (main)

import ScoresTableTests
import Example

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "ScoresTableTests" [ScoresTableTests.scoresTableTests],     Test.describe "Example" [Example.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 405651571746940, processes = 8, globs = [], paths = ["/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/Example.elm","/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/ScoresTableTests.elm"]}