//
//  VKModels.swift
//
//
//  Created by Artem Solovev on 06.06.2024.
//

import Foundation

// MARK: - VkModel
struct VkModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let profArea: ProfArea
    let group: Group
    let title: String
    let town: ProfArea
    let workFormat: String
    let specialty: ProfArea

    enum CodingKeys: String, CodingKey {
        case profArea = "prof_area"
        case group, title, town
        case workFormat = "work_format"
        case specialty
    }
}

// MARK: - Group
struct Group: Codable {
    let name: String
    let projectLogo: String

    enum CodingKeys: String, CodingKey {
        case name
        case projectLogo = "project_logo"
    }
}

// MARK: - ProfArea
struct ProfArea: Codable {
    let name: String
}
