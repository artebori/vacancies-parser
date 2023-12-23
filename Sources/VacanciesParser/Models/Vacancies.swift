//
//  Vacancies.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

// MARK: - Vacancies
public struct Vacancies: Codable {
    var count: Int?
    var items: [ItemVacancies]?
}

// MARK: - Item
public struct ItemVacancies: Codable {
    var id: Int?
    var createdAt: String?
    var owner, position, about: String?
    var requirements, responsibilities, conditions: Conditions?
    var meta: [Meta]?
}

// MARK: - Conditions
public struct Conditions: Codable {
    var title, content: String?
}

// MARK: - Meta
public struct Meta: Codable {
    var id: Int?
    var type, value: String?
}
