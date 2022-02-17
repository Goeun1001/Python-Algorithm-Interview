class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var queue = [root]
        var result = [String]()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node == nil {
                result.append("#")
            } else {
                queue.append(node!.left)
                queue.append(node!.right)
                
                result.append(String(node!.val))
            }
        }
        
        return result.joined(separator: " ")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let nodes = data.split(separator: " ").map { String($0) }
        
        if nodes[0] == "#" { return nil }
        
        let root = TreeNode(Int(nodes[0])!)
        var queue = [root]
        var index = 1
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if nodes[index] != "#" {
                node.left = TreeNode(Int(nodes[index])!)
                queue.append(node.left!)
            }
            index += 1
            
            if nodes[index] != "#" {
                node.right = TreeNode(Int(nodes[index])!)
                queue.append(node.right!)
            }
            index += 1
        }
        
        return root
    }
}
