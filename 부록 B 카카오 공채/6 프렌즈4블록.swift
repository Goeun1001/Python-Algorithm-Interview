import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0) }
    
    while true {
        // 1) 일치 여부 판별
        var matched = [[Int]]()
        
        for i in 0..<m - 1 {
            for j in 0..<n - 1 {
                if board[i][j] == board[i][j + 1] && board[i][j + 1] == board[i + 1][j + 1] && board[i + 1][j + 1] == board[i + 1][j] && board[i + 1][j] != "#" {
                    matched.append([i, j])
                }
            }
        }
        
        if matched.isEmpty { break }

        // 2) 일치한 위치 삭제
        for match in matched {
            let i = match[0], j = match[1]
            board[i][j] = "#"
            board[i][j + 1] = "#"
            board[i + 1][j + 1] = "#"
            board[i + 1][j] = "#"
        }

        // 3) 빈공간 블럭 처리
        for _ in 0..<m {
            for i in 0..<m - 1 {
                for j in 0..<n {
                    if board[i + 1][j] == "#" {
                        board[i + 1][j] = board[i][j]
                        board[i][j] = "#"
                    }
                }
            }
        }
    }

    return board.map { $0.filter { $0 == "#" }.count }.reduce(0, +)
}
