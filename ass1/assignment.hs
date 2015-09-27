import Data.Set as Set
import Data.List as List
import Data.Char as Char

noiseWordList = ["a", "about", "above", "after", "again", "against", "all", "am", "an", "and", "any", "are", "as",
 "at", "be", "because", "been", "before", "being", "below", "between", "both", "but", "by", "cannot", "could", "did",
 "do", "does", "doing", "down", "during", "each", "few", "for", "from", "further", "had", "has", "have", "having",
 "he", "her", "here", "hers", "herself", "him", "himself", "his", "how", "i", "if", "in", "into", "is", "it", "its",
 "itself", "me", "more", "most", "my", "myself", "no", "nor", "not", "of", "off", "on", "once", "only", "or", "other",
 "ought", "our", "ours", "out", "over", "own", "same", "she", "should", "so", "some", "such", "than", "that", "the",
 "their", "theirs", "them", "themselves", "then", "there", "these", "they", "this", "those", "through", "to", "too",
 "under", "until", "up", "very", "was", "we", "were", "what", "when", "where", "which", "while", "who", "whom", "why",
 "with", "would", "you", "your", "yours", "yourself", "yourselves"]

wordCount :: String -> Int
wordCount = length . words

distinctWords :: String -> [String]
distinctWords = Set.toList . Set.fromList . words

wordFrequency :: String -> [(String, Int)]
wordFrequency = List.map(\x -> (head x, length x)) . group . sort . words . removeNoise

removeNoise :: String -> String
removeNoise content = unwords $ listDiff (words content) noiseWordList

listDiff :: [String] -> [String] -> [String] -- ignoring the case
listDiff xs ys = [x | x <- xs, List.map(\c -> Char.toLower c) x `notElem` ys]

main = do
    content <- getLine >>= readFile
    putStr "\nWord Count: "
    print $ wordCount content
    putStr "\nDistinct Words: "
    print $ distinctWords content
    putStr "\nWord Frequency: "
    print $ wordFrequency content
