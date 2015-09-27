# CS653A : Assignment 1

### Word Count
- Given a string, split it into list of words using `words` function
- Evaluate `length` of the list.

### Distinct Words
- Given a string, split it into list of words using `words` function
- Form a set from the list of words using `Set.fromList` to get unique words
- Convert the set back to list using `Set.toList`

### Word Frequency (ignore noise)
- Stopwords list credits: http://www.ranks.nl/stopwords
- Remove noise words by taking list difference. Case is ignored as the list of stop words has only lower case words
- Remaining string is split into list using `words`
- The list is sorted and grouped using composition `group . sort`.
- A group has all the elements same, so form pairs (element, length of group) mapping over complete grouped list.
- Case may be ignored in counting as well, but I have chosen not to.

### Build and Run
- `runhaskell assignment.hs`
- Enter the path to the file to be analyzed. `/path/to/file`

### Output
- First line is the word count of the file.
- Second line is list of distinct words in the file
- Third line is the word frequency of the file, printed as list of pairs of (word, count).

-----------------
Author: Saurav Kumar (12641)
