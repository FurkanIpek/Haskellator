module Main (main) where

import Utils.MiscUtils as Utils
import Utils.ExtendTypes as ExtendTypes
import Types.Texts as Texts
import Types.Date as Date
import Types.Tree as Tree
import Types.TrafficLight as TrafficLight
import qualified Data.List as List

main =
    let
        arr = [1, 3, 12, -5, 70, -5, 2, 3]
        strArr = "avytopklva"
        haskellatorCodeBase = Texts.Code { repoName = "Haskellator code base", contributors = ["Furkan Ipek", "mfi"]}
        aGloriousDay = Date.Date { day = Date.Monday, month = Date.December, year = 2016 }
        aBook = Texts.Book { author = "aProgrammer", publish = aGloriousDay, title = "How NOT TO Program?" }
    in
        do
            putStr $ "A glorious day: " ++ (show aGloriousDay) ++ "\n\n"
            print $ "Sorted array(via quicksort): " ++ show (Utils.quicksort arr)
            print $ "Sorted array(via mergesort): " ++ (Utils.mergesort strArr)
            putStr "\n"

            putStr "Following is a summary of this code base:\n"
            putStrLn $ "\tRepository name: " ++ (Utils.titleCase $ repoName haskellatorCodeBase)
            putStr $ "\tContributors: " ++ List.intercalate ", " (contributors haskellatorCodeBase)
            putStr "\nLame pretty print version of the code base:\n\t"
            ExtendTypes.prettyPrint haskellatorCodeBase
            putStr "\n\n"

            putStr $ "Pushing " ++ show aBook ++ "\n"
            putStr $ show (pushToRepo aBook) ++ "\n\n"
            putStrLn $ "Pushing " ++ show haskellatorCodeBase
            print $ pushToRepo haskellatorCodeBase
            putStr "\n"

            print $ Utils.replicate' 5 'a'
            -- print $ Utils.replicate' (-1) 'a' -- this throws an error and ends the execution
            putStr "\n"
           
            Tree.treeModule
            TrafficLight.trafficLightModule

            ExtendTypes.prettyPrint (5 :: Int)

            return 0