import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty { return false }
        
        // 첫 행의 맨 뒤
        var row = 0
        var col = matrix[0].count - 1
        
        while row <= matrix.count - 1 && col >= 0 {
            if target == matrix[row][col] {
                return true
            }
            
            else if target < matrix[row][col] { // # 타겟이 작으면 왼쪽으로
                col -= 1
            } else if target > matrix[row][col] { // 타겟이 크면 아래로
                row += 1
            }
        }
        
        return false
    }
}
