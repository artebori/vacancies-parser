//
//  NetworkManager.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

//MARK: - URL extension
private extension URL {
    // TODO: Place the links in the environment
    static let vacancyRaifURL = baseRaifURL
        .appending(path: "api/vacancy")
        .appending(queryItems: [URLQueryItem(name: "owner", value: "career")])
    
    static let vacancyVKUrl = baseVKUrl
        .appending(queryItems: [URLQueryItem(name: "tags", value: "2243")])

    static let baseRaifURL = URL(string: "https://career.raiffeisen.ru/")!
    static let baseVKUrl = URL(string: "https://team.vk.company/career/api/v2/vacancies/")!
}

//MARK: - Main logic service
final class NetworkManager {
    private let session: URLSession

    // MARK: - Initializers
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Methods
    func getRaifaisenVacancies() async throws -> [ItemVacancy] {
        let (data, _) = try await session.data(from: .vacancyRaifURL)
        let vacancies = try JSONDecoder().decode(Vacancies.self, from: data)
        return vacancies.items ?? []
    }
    
    func getVKVacancies() async throws -> [ItemVacancy] {
        var vacancies: [ItemVacancy] = []
        let (data, _) = try await session.data(from: .vacancyVKUrl)
        let vacanciesVkModel = try JSONDecoder().decode(VkModel.self, from: data)
        
        vacanciesVkModel.results.forEach { vacancy in
            vacancies.append(ItemVacancy(id: Int.random(in: 0..<10000), createdAt: Date.now.ISO8601Format(), owner: "", position: vacancy.title, about: "", requirements: nil, responsibilities: nil, conditions: nil, meta: [
                Meta(id: nil, type: "", value: vacancy.workFormat),
                Meta(id: nil, type: "", value: vacancy.profArea.name),
                Meta(id: nil, type: "", value: vacancy.specialty.name)
            ]))
        }
        return vacancies
    }
    
}
