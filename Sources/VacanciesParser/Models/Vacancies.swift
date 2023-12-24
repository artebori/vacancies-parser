//
//  Vacancies.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

// MARK: - Vacancies
public struct Vacancies: Codable {
    let count: Int?
    let items: [ItemVacancy]?
}

// MARK: - Item
public struct ItemVacancy: Codable, Identifiable {
    public let id: Int?
    let createdAt: String?
    let owner, position, about: String?
    let requirements, responsibilities, conditions: Condition?
    let meta: [Meta]?
}

// MARK: - Conditions
public struct Condition: Codable {
    let title, content: String?
}

// MARK: - Meta
public struct Meta: Codable {
    let id: Int?
    let type, value: String?
}
