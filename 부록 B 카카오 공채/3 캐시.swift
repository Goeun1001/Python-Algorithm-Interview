import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var result = 0
    var queue = [String]()
    
    for city in cities {
        let city = city.lowercased()
        
        if queue.contains(city) { // hit
            result += 1
            queue.remove(at: queue.firstIndex(of: city)!)
        } else { // miss
            result += 5
            
            if cacheSize == 0 {
                continue
            }
            if queue.count >= cacheSize {
                queue.removeFirst()
            }
        }
        
        queue.append(city)
    }
    
    return result
}
