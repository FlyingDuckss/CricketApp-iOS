//
//  TeamModel.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

import Foundation

// MARK: - Response Model
struct ApiResponse_TeamModel: Codable {
    let apikey: String
    let data: [Country]
    let status: String
    let info: Inform
}

// MARK: - Country Model
struct Country: Codable {
    let id: String
    let name: String
    let genericFlag: String
}

// MARK: - Info Model
struct Inform: Codable {
    let hitsToday: Int
    let hitsUsed: Int
    let hitsLimit: Int
    let credits: Int
    let server: Int
    let offsetRows: Int
    let totalRows: Int
    let queryTime: Double
    let s: Int
    let cache: Int
}
