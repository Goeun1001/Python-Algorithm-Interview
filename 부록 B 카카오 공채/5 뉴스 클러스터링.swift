import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = Array(str1.lowercased())
    let str2 = Array(str2.lowercased())
    
    let letters = "abcdefghijklmnopqrstuvwxyz"
    var A = [String]()
    var B = [String]()
    
    for i in 0..<str1.count - 1 {
        if letters.contains(str1[i]) && letters.contains(str1[i + 1]) {
            let str = String(str1[i...i + 1])
            A.append(str)
        }
    }
    
    for i in 0..<str2.count - 1 {
        if letters.contains(str2[i]) && letters.contains(str2[i + 1]) {
            let str = String(str2[i...i + 1])
            B.append(str)
        }
    }
    
    let s = Set(A + B)
    var intersect = 0
    var union = 0
    
    for str in s {
        let aCount = A.filter { $0 == str }.count
        let bCount = B.filter { $0 == str }.count
        intersect += min(aCount, bCount)
        union += max(aCount, bCount)
    }
    
    if intersect == 0 && union == 0 {
        return 1 * 65536
    } else {
        return Int((Double(intersect) / Double(union)) * 65536)
    }
}
