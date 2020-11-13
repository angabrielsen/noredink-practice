module Test.Generated.Main1216178765 exposing (main)

import ScoresTableTests
import Example

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "ScoresTableTests" [ScoresTableTests.scoreCalculatorTests],     Test.describe "Example" [Example.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 103741646534206, processes = 8, globs = [], paths = ["/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/Example.elm","/Users/ashtongabrielsen/dev/practice/noredink-practice/tests/ScoresTableTests.elm"]}