module Utils.MiscUtils (
    quicksort
)
where

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort all@(x:xs) = 
    let
        left  = filter (\elem -> elem <  x) xs
        right = filter (\elem -> elem >= x) xs
    in
        (quicksort left) ++ [x] ++ (quicksort right)