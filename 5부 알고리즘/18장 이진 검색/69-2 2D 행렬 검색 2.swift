import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return matrix.map { $0.filter { $0 == target }.count }.reduce(0, +) >= 1
    }
}
