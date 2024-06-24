import XCTest
@testable import VacanciesParser

final class VacanciesParserTests: XCTestCase {
    func testGetVacancies() async throws {
       let parser = VacanciesParser()
        
        let vacancies = await parser.getIOSVacancies(companyType: .vk)
        
        print(vacancies)
        
        XCTAssert(vacancies.count > 0)
    }
}
