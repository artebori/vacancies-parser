//
//  NetworkManager.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    //TODO: Place the link in the environment
    //MARK: - Base Urls
    private let baseUrl = URL(string: "https://career.raiffeisen.ru/api/vacancy?owner=career")
    
    //MARK: - Url Session
    private let session = URLSession.shared
    
    private func getVacanciesFromNetwork() async -> String {
        guard let url = baseUrl else { return "" }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (_, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { return "" }
            
            switch httpResponse.statusCode {
            case 200:
                return "IS WORKING!"
            default: break
            }
        } catch {
            return "Failed to get vacancies from site"
        }
        
        return ""
    }
    
    func getVacancies(completition: @escaping(String) -> Void) {
        Task {
            let message = await getVacanciesFromNetwork()
            completition(message)
        }
    }
}
