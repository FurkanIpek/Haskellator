module Main (main) where

import Utils.MiscUtils as Utils
import Types.Texts as Texts
import Types.Date as Date
import Types.Tree as Tree
import qualified Data.List as List

main :: IO Integer
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
            putStr $ "\tRepository name: " ++ (Utils.titleCase $ repoName haskellatorCodeBase) ++ "\n"
            putStr $ "\tContributors: " ++ List.intercalate ", " (contributors haskellatorCodeBase)
            putStr "\n\n"

            putStr $ "Pushing " ++ show aBook ++ "\n"
            putStr $ show (pushToRepo aBook) ++ "\n\n"
            putStr $ "Pushing " ++ show haskellatorCodeBase ++ "\n"
            print $ pushToRepo haskellatorCodeBase
            putStr "\n"

            print $ Utils.replicate' 5 'a'
            -- print $ Utils.replicate' (-1) 'a' -- this throws an error and ends the execution
            putStr "\n"
           
            Tree.testTreeModule

            return 0