import Foundation

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var digs = [String]()
        var lets = [String]()
        
        for log in logs {
            if log.split(separator: " ")[1].allSatisfy({ $0.isNumber }) {
                digs.append(log)
            } else {
                lets.append(log)
            }
        }
        
        lets.sort(by: {
            let array1 = $0.components(separatedBy: " ")
            let array2 = $1.components(separatedBy: " ")
            
            if array1[1..<array1.count] == array2[1..<array2.count] {
                return String(array1[0]) < String(array2[0])
            } else {
                return Array(array1[1..<array1.count]).joined(separator: " ") < Array(array2[1..<array2.count]).joined(separator: " ")
            }
        })
        
        return lets + digs
    }
}
