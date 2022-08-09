struct Skill {
    let id: Int
    let name: String
    let colorString: String
}

extension Skill: Codable {
    private enum CodingKeys: String, CodingKey {
        case colorString = "color"
        case id
        case name
    }
}
