import Foundation

struct DayShifts {
    let dateString: String
    let shifts: [Shift]
    
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        
        return dateFormatter.date(from: dateString)!
    }
}

extension DayShifts: Codable {
    private enum CodingKeys: String, CodingKey {
        case dateString = "date"
        case shifts
    }
}

extension DayShifts: Comparable {
    static func < (lhs: DayShifts, rhs: DayShifts) -> Bool {
        lhs.date > rhs.date
    }
    
    static func == (lhs: DayShifts, rhs: DayShifts) -> Bool {
        lhs.dateString == rhs.dateString
    }
}
