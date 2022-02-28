import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var counts = [Int: Int]()
        
        for num in nums {
            if counts[num] == nil {
                var cnt = 0
                
                for i in nums {
                    if i == num {
                        cnt += 1
                    } else if i > num {
                        counts[num] = cnt
                        break
                    }
                }
                
                counts[num] = cnt
            }
            
            if counts[num]! > nums.count / 2 {
                return num
            }
        }
        
        return -1
    }
}

print(Solution().majorityElement([2,2,1,1,1,2,2])) // 2
