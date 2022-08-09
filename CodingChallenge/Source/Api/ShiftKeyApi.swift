import Moya
import Foundation

enum ShiftKeyApi: TargetType {
    case getAvailableShifts(
        address: String,
        type: AvailableShiftsType? = nil,
        start: Date? = nil,
        end: Date? = nil,
        radius: Int? = nil
    )
    
    var baseURL: URL {
        URL(string: "https://staging-app.shiftkey.com/api/v2/")!
    }
    
    var path: String {
        switch self {
        case .getAvailableShifts:
            return "available_shifts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAvailableShifts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAvailableShifts:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        [
            "Content-Type" : "application/json",
            "Accept" : "application/json"
        ]
    }
    
    private var parameters: [String: Any] {
        switch self {
        case let .getAvailableShifts(address, type, start, end, radius):
            let allParameters: [String: Any?] = [
                "address" : address,
                "type" : type?.rawValue,
                "start" : start?.ISO8601Format(),
                "end" : end?.ISO8601Format(),
                "radius" : radius
            ]
            
            return allParameters.compactMapValues { $0 }
        }
    }
}
