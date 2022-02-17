import Foundation

class Node {
    let value: Character?
    var children = [Character: Node]()
    var isEnd: Bool
    
    init(value: Character? = nil, isEnd: Bool = false) {
        self.value = value
        self.isEnd = isEnd
    }
}

class Trie {
    let root = Node()

    init() {}
    
    func insert(_ word: String) {
        var current = root
        
        for char in word {
            if current.children[char] == nil {
                let node = Node(value: char)
                current.children[char] = node
            }
            current = current.children[char]!
        }
        
        current.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var current = root
        
        for char in word {
            if current.children[char] == nil {
                return false
            }
            current = current.children[char]!
        }
        
        return current.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = root
        
        for char in prefix {
            if current.children[char] == nil {
                return false
            }
            current = current.children[char]!
        }
        
        return true
    }
}

let trie = Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True
