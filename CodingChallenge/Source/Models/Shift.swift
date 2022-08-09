import Foundation

struct Shift: Identifiable {
    let id: Int
    let startDate: String
    let endDate: String
    let normalizedStartDate: String
    let normalizedEndDate: String
    let timezone: String
    let premiumRate: Bool
    let covid: Bool
    let shiftKind: String
    let withinDistance: Int
    let facilityType: FacilityType
    let skill: Skill
    let localizedSpecialty: LocalizedSpecialty
}

extension Shift: Codable {
    private enum CodingKeys: String, CodingKey {
        case id = "shift_id"
        case startDate = "start_time"
        case endDate = "end_time"
        case normalizedStartDate = "normalized_start_date_time"
        case normalizedEndDate = "normalized_end_date_time"
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }
}
