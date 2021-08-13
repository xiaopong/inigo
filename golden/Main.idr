module Main

import Test.Golden

%default covering

allTests : TestPool
allTests = MkTestPool "Name of the pool" [] Default
  [ "test001"
  ]

main : IO ()
main = runner
  [ testPaths "inigo" allTests
  ] where
    testPaths : String -> TestPool -> TestPool
    testPaths dir = record { testCases $= map ((dir ++ "/") ++) }
