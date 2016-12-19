module Types.Texts (
    Text(..),
    pushToRepo
)
where

import Types.Date as Date

data Text = Novel { author :: String, publish :: Date.Date, title :: String }
          | Code  { repoName :: String, contributors :: [String] } 
        deriving (Eq, Show)

-- TODO learn how to print debug info in functions
pushToRepo :: Text -> Either String String
pushToRepo (Code r c) = --_ <- print "git push -u origin master"
                        Right "Success"
pushToRepo _ = Left "Not a repository"