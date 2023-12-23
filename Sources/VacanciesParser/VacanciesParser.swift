// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public class VacanciesParser {
    func testPrint() {
        NetworkManager.shared.getVacancies { str in
            print(str)
        }
    }
}
