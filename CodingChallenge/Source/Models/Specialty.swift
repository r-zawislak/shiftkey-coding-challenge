struct Specialty {
    let abbreviation: String
    let colorString: String
    let id: Int
    let name: String
}

extension Specialty: Codable {
    private enum CodingKeys: String, CodingKey {
        case colorString = "color"
        case id
        case name
        case abbreviation
    }
}
