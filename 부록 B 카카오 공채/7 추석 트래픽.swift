import Foundation

func solution(_ lines:[String]) -> Int {
    var times: [(begin: Double, end: Double)] = []

    for line in lines {
        let a = line.split(separator: " ")  // 2016-09-15 01:00:04.001 2.0s
        let b = a[1].split(separator: ":")  // 01:00:04.001

        let T = Double(a[2].split(separator: "s").first!)!
        let end = Double(b[0])!*3600 + Double(b[1])!*60 + Double(b[2])!
        let begin = end - T + 0.001
        times.append((begin: begin, end: end))
    }
    
    var result = 0
    
    for _time in times {
        let end = _time.end
        var count = 0
        for time in times {
            if (time.begin >= end && time.begin < end + 1) ||   // 시작시간이 1초 안에 있는 경우
                ((time.end >= end && time.end < end + 1)) ||    // 끝시간이 1초 안에 있는 경우
                (time.begin < end && time.end >= end + 1) {     // 시작시간이 1초 전이고 끝시간이 1초 이후인 경우
                count += 1
            }
        }
        result = max(result, count)
    }
    return result
}
