import Foundation

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard tasks.count > 0 else {
            return 0
        }
        
        let taskFreqs = Dictionary(tasks.map { ($0, 1) }, uniquingKeysWith: +)
        let sortedTasks = taskFreqs.keys.sorted { return taskFreqs[$0]! > taskFreqs[$1]! }
        var mostFreqCount = 0
        
        // get interval number for last cycle
        for sortedTask in sortedTasks {
            if taskFreqs[sortedTask] != taskFreqs[sortedTasks[0]] {
                break
            }
            
            mostFreqCount += 1
        }
        
        // when number of different tasks is greater than n + 1, and the most freqent task won't cause idle run,
        // then we should return tasks.count
        return max(tasks.count, (taskFreqs[sortedTasks[0]]! - 1) * (n + 1) + mostFreqCount)
    }
}

//print(Solution().leastInterval(["A","A","A","B","B","B"], 2)) // 8
print(Solution().leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2)) // 16
