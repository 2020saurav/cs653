import Data.Set as Set
import Data.List as List

noiseWordList = ["a", "an", "the"]

wordCount :: String -> Int
wordCount = length . words

distinctWordCount :: String -> Int
distinctWordCount = length . Set.toList . Set.fromList . words

wordFrequency :: String -> [(String, Int)]
wordFrequency = List.map(\x -> (head x, length x)) . group . sort . words . removeNoise

removeNoise :: String -> String
removeNoise content = unwords $ listDiff (words content) noiseWordList

listDiff :: [String] -> [String] -> [String]
listDiff xs ys = [x | x <- xs, x `notElem` ys]

main = do
    content <- getLine >>= readFile
    print $ wordCount content
    print $ distinctWordCount content
    print $ wordFrequency content
