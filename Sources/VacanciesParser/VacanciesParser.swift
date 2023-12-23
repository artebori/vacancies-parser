// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct VacanciesParser {
    func test() {
        NetworkManager.shared.getVacancies { str in
            print(str)
        }
    }
}
