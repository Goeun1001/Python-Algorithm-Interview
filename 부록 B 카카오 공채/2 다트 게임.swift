import Foundation

func solution(_ dartResult:String) -> Int {
    var answer = [Int]()
    var temp = ""
    
    for dart in dartResult {
        if Int(String(dart)) != nil {
            temp.append(dart)
        } else if "SDT".contains(dart) {
            let num = Int(temp)!
            temp = ""
            
            if dart == "S" {
                answer.append(num)
            } else if dart == "D" {
                answer.append(num * num)
            } else if dart == "T" {
                answer.append(num * num * num)
            }
        } else if "*#".contains(dart) {
            let first = answer.removeLast()
            
            if dart == "*" {
                if !answer.isEmpty {
                    var second = answer.removeLast()
                    answer.append(second * 2)
                }
                answer.append(first * 2)
            } else if dart == "#" {
                answer.append(first * -1)
            }
        }
    }
    
    return answer.reduce(0, +)
}
