import Foundation

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        let s = s.sorted()
        
        var child = 0, cookie = 0
        
        while child < g.count && cookie < s.count {
            if s[cookie] >= g[child] {
                child += 1
            }
            cookie += 1
        }
        
        return child
    }
}

