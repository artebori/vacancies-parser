//
//  ExtensionForNetworkManager.swift
//  
//
//  Created by Artem Solovev on 06.06.2024.
//

import Foundation

//MARK: - Html parser extension
extension NetworkManager {
    func parseHTMLandExtractJSON(from html: String) -> Data? {
        do {
            // Используем регулярное выражение для поиска всех тегов <script>
            let regex = try NSRegularExpression(pattern: "<script[^>]*>(.*?)</script>", options: .dotMatchesLineSeparators)
            let nsrange = NSRange(html.startIndex..<html.endIndex, in: html)
            let matches = regex.matches(in: html, options: [], range: nsrange)
            
            for match in matches.reversed() {
                if let scriptRange = Range(match.range(at: 1), in: html) {
                    let scriptContent = String(html[scriptRange])
                    
                    // Пытаемся найти JSON в содержимом тега <script>
                    if let jsonRange = scriptContent.range(of: "\\{.*\\}", options: .regularExpression) {
                        let jsonString = String(scriptContent[jsonRange])
                        
                        // Преобразуем строку в данные
                        if let jsonData = jsonString.data(using: .utf8) {
                            return jsonData
                        }
                    }
                }
            }
        } catch {
            print("Ошибка парсинга HTML: \(error)")
        }
        
        return nil
    }
}
