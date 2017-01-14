import Data.Char
import Control.Monad

titleCase :: String -> String
titleCase ls = tail $ foldl
    (\acc y -> 
        if (isWordEnding (last acc)) then
            acc ++ [(Data.Char.toUpper y)]
        else
            acc ++ [(Data.Char.toLower y)]
    ) [' '] ls

isWordEnding :: Char -> Bool
isWordEnding c
    | c == ' '  = True
    | c == '\n' = True
    | c == '\t' = True
    | c == '\r' = True
    | c == '.'  = True
    | c == ':'  = True
    | otherwise = False

main = forever $ do
    str <- getContents
    putStr $ titleCase str