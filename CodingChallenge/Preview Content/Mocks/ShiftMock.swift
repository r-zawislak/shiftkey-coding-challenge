import Foundation

extension Shift {
    static var mock: Self {
        Shift(
            id: .random,
            startDate: Date().ISO8601Format(),
            endDate: Date().ISO8601Format(),
            normalizedStartDate: "Start date",
            normalizedEndDate: "End date",
            timezone: "Central",
            premiumRate: .random(),
            covid: .random(),
            shiftKind: "Night Shift",
            withinDistance: 70,
            facilityType: .mock,
            skill: .mock,
            localizedSpecialty: .mock
        )
    }
}
