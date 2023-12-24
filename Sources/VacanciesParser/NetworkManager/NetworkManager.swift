//
//  NetworkManager.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

private extension URL {
    // TODO: Place the links in the environment
    static let vacancyURL = baseURL.appending(path: "api/vacancy?owner=career")
    static let baseURL = URL(string: "https://career.raiffeisen.ru/")!
}

final class NetworkManager {
    private let session: URLSession

    // MARK: - Initializers
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Methods
    func getVacancies() async throws -> [ItemVacancy] {
        let (data, _) = try await session.data(from: .vacancyURL)
        let vacancies = try JSONDecoder().decode(Vacancies.self, from: data)
        return vacancies.items ?? []
    }
}
