//
//  VKModels.swift
//
//
//  Created by Artem Solovev on 06.06.2024.
//

import Foundation

// MARK: - VkVacancies
struct VkVacancies: Codable {
    let props: Props?
}

// MARK: - Props
struct Props: Codable {
    let pageProps: PageProps?
}

// MARK: - PageProps
struct PageProps: Codable {
    let initialVacancies: [InitialVacancy]?
    let initialTotalCount: Int?
}

// MARK: - InitialVacancy
struct InitialVacancy: Codable {
    let id: Int?
    let profArea: ProfArea?
    let group: Group?
    let title: String?
    let town: ProfArea?
    let tags: [ProfArea]?
    let remote, externalProgram: Bool?
    let specialty: ProfArea?

    enum CodingKeys: String, CodingKey {
        case id
        case profArea = "prof_area"
        case group, title, town
        case tags, remote
        case externalProgram = "external_program"
        case specialty
    }
}

// MARK: - Group
struct Group: Codable {
    let id: Int?
    let name: String?
    let projectLogo: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case projectLogo = "project_logo"
    }
}

// MARK: - ProfArea
struct ProfArea: Codable {
    let id: Int?
    let name: String?
}
