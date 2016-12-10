module Types.Texts (
    Text(..)
)
where

type Year = Int

data Text = Novel { author :: String, publish :: Year, title :: String }
          | Code  { repoName :: String, contributors :: [String] } 
        deriving (Eq, Show)