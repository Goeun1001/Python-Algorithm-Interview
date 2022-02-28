import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var red = 0
        var white = 0
        var blue = nums.count

        while white < blue {
            if nums[white] < 1 {
                nums.swapAt(red, white)
                white += 1
                red += 1
            } else if nums[white] > 1 {
                blue -= 1
                nums.swapAt(white, blue)
            } else {
                white += 1
            }
        }
    }
}
