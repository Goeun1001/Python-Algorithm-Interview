import Foundation

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        if gas.reduce(0, +) < cost.reduce(0, +) {
            return -1
        }
        
        var start = 0, fuel = 0
        
        for i in 0..<gas.count {
            if gas[i] + fuel < cost[i] {
                start = i + 1
                fuel = 0
            } else {
                fuel += gas[i] - cost[i]
            }
        }
        
        return start
    }
}
