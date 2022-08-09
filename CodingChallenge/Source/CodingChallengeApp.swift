//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI
import Moya

@main
struct CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ShiftsView()
        }
    }
}

extension Data {
    var formattedJSONString: String {
        guard
            let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        else {
            return ""
        }
        
        return String(decoding: jsonData, as: UTF8.self)
    }
}
