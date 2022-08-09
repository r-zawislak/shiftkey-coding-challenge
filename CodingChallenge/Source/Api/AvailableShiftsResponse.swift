struct AvailableShiftsResponse: Codable {
    let data: [DayShifts]
    let links: [String]
    let meta: Meta
}
