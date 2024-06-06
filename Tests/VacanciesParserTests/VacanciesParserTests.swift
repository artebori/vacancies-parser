import XCTest
@testable import VacanciesParser

final class VacanciesParserTests: XCTestCase {
    func testGetVacancies() async throws {
       let test = VacanciesParser()
        
        let vacancies = await test.getIOSVacancies(companyType: .vk)
        print(vacancies)
    }
}
