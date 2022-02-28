class Solution {
    func distance(_ x: Int, _ y: Int) -> Double {
        return sqrt(pow(Double(abs(0 - x)), 2) + pow(Double(abs(0 - y)), 2))
    }
    
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var count = 0
        var dist = -1.0
        var result = [[Int]]()
        
        for point in points.sorted(by: { distance($0[0], $0[1]) < distance($1[0], $1[1])}) {
            count += 1
            
            if count <= k {
                result.append(point)
            }
        }
        
        return result
    }
}
