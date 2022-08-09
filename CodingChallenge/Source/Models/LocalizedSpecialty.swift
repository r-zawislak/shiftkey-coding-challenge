struct LocalizedSpecialty {
    let abbreviation: String
    let id: Int
    let name: String
    let specialty: Specialty
    let specialtyId: Int
    let stateId: Int
}

extension LocalizedSpecialty: Codable {
    private enum CodingKeys: String, CodingKey {
        case abbreviation
        case id
        case name
        case specialty
        case specialtyId = "specialty_id"
        case stateId = "state_id"
    }
}
