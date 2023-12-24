//
//  Vacancies.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

// MARK: - Vacancies
public struct Vacancies: Codable {
    public let count: Int?
    public let items: [ItemVacancy]?
}

// MARK: - Item
public struct ItemVacancy: Codable, Identifiable {
    public let id: Int?
    public let createdAt: String?
    public let owner, position, about: String?
    public let requirements, responsibilities, conditions: Condition?
    public let meta: [Meta]?
}

// MARK: - Conditions
public struct Condition: Codable {
    public let title, content: String?
}

// MARK: - Meta
public struct Meta: Codable, Identifiable {
    public let id: Int?
    public let type, value: String?
}
