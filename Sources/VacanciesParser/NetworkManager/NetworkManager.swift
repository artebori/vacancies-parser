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
    static let baseVKUrl = URL(string: "https://team.vk.company/vacancy/")!
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
        var returnedVacancies: [ItemVacancy] = []
        let (data, _) = try await session.data(from: .vacancyVKUrl)
        if let htmlString = String(data: data, encoding: .utf8) {
            guard let json = parseHTMLandExtractJSON(from: htmlString) else { return [] }
            let vacancies = try JSONDecoder().decode(VkVacancies.self, from: json)
            let allVkVaccancies = vacancies.props?.pageProps?.initialVacancies ?? []
            allVkVaccancies.forEach { vacancy in
                returnedVacancies.append(ItemVacancy(id: Int.random(in: 0...9000), createdAt: Date.now.ISO8601Format(), owner: "", position: vacancy.title ?? "", about: vacancy.specialty?.name ?? "", requirements: Condition(title: "", content: ""), responsibilities: Condition(title: "", content: ""), conditions: Condition(title: "", content: ""), meta: [Meta(id: Int.random(in: 0...9000), type: "", value: "Тестовая мета для вк")]))
            }
            return returnedVacancies
        }
        return returnedVacancies
    }
    
}
