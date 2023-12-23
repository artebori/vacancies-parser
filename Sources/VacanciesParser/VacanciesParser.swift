// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct VacanciesParser {
    func testPrint() {
        NetworkManager.shared.getVacancies { str in
            print(str)
        }
    }
}
