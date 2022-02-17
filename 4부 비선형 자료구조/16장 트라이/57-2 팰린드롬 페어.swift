import Foundation

class Node {
    var value: Character?
    var children = [Character: Node]()
    var wordId: Int
    var palindromes = [Int]()
    
    init(value: Character? = nil, wordId: Int = -1) {
        self.value = value
        self.wordId = wordId
    }
}

class Trie {
    let root = Node()
    
    init() {}
    
    func isPalindrome(word: String) -> Bool {
        return word == String(word.reversed())
    }
    
    func insert(_ index: Int, _ word: String) {
        var node = root
        
        for (i, char) in String(word.reversed()).enumerated() {
            if isPalindrome(word: String(Array(word)[0..<word.count - i])) {
                node.palindromes.append(index)
            }
            if node.children[char] == nil {
                let newNode = Node(value: char)
                node.children[char] = newNode
            }
            node = node.children[char]!
            node.value = char
        }
        node.wordId = index
    }
    
    func search(_ index: Int, _ word: String) -> [[Int]] {
        var result = [[Int]]()
        var node = root
        var word = word
        
        while !word.isEmpty {
            // 판별 로직 3) (본문 설명 참고)
            if node.wordId >= 0 {
                if isPalindrome(word: word) {
                    result.append([index, node.wordId])
                }
            }
            let char = word.removeFirst()
            
            if node.children[char] == nil {
                return result
            }
            node = node.children[char]!
        }
        
        // 판별 로직 1) (본문 설명 참고)
        if node.wordId >= 0 && node.wordId != index {
            result.append([index, node.wordId])
        }
        
        // 판별 로직 2) (본문 설명 참고)
        for id in node.palindromes {
            result.append([index, id])
        }
        
        return result
    }
}

class Solution {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        let trie = Trie()

        for (i, word) in words.enumerated() {
            trie.insert(i, word)
        }

        var results = [[Int]]()
        for (i, word) in words.enumerated() {
            trie.search(i, word).forEach { results.append($0) }
        }

        return results
    }
}
