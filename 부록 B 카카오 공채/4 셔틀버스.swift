import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var time = [Int]()
    
    for table in timetable {
        let table = Array(table)
        time.append(Int(String(table[0...1]))! * 60 + Int(String(table[3...4]))!)
    }
    
    time.sort()
    
    var current = 540
    var result = 0
    
    for _ in 0..<n {
        for _ in 0..<m {
            // 대기가 있는 경우 1분 전 도착
            if !time.isEmpty && time.first! <= current {
                result = time.removeFirst() - 1
            } else { // 대기가 없는 경우 정시 도착
                result = current
            }
        }
        
        current += t
    }
    
    let hour = result / 60
    let minute = result % 60
    
    return String(format: "%02d", hour) + ":" + String(format: "%02d", minute)
}

//solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]) // "09:00"
solution(2, 10, 2, ["09:10", "09:09", "08:00"]) // "09:09"
