import XCTest
@testable import NumbersCore

final class NumbersCoreTests: XCTestCase {

    func testTriviaTypeURLString() throws {
        // Given
        let triviaType = NumberFactType.trivia(requestedNumber: "77")
        // When
        let expectedString = triviaType.urlString()
        // Then
        XCTAssertEqual(expectedString, "77/trivia")
    }
        
    func testRangeTypeUrlString() throws {
        let rangeType = NumberFactType.range(min: "3", max: "5")
        let expectedString = rangeType.urlString()
        XCTAssertEqual(expectedString, "random?min=3&max=5")
    }
    
    func testTriviaTypeUrlStringWrong() throws {
        let triviaType = NumberFactType.trivia(requestedNumber: "56")
        let expectedString = triviaType.urlString()
        XCTAssertNotEqual(expectedString, "56")
    }
    
    func testRangeTypeUrlStringWrong() throws {
        let rangeType = NumberFactType.range(min: "100", max: "150")
        let expectedString = rangeType.urlString()
        XCTAssertNotEqual(expectedString, "randommin=100&max=150")
    }
    
    func testCreateLinkForTriviaRequest() throws {
        // Given
        let type = NumberFactType.trivia(requestedNumber: "42")
        // When
        let expectedUrl = APIBuilder().createLinkForRequest(type: type)
        // Then
        XCTAssertEqual(expectedUrl, "http://numbersapi.com/42/trivia")
    }

    func testCreateLinkForRangeRequest() throws {
        let type = NumberFactType.range(min: "10", max: "20")
        let expectedUrl = APIBuilder().createLinkForRequest(type: type)
        XCTAssertEqual(expectedUrl, "http://numbersapi.com/random?min=10&max=20")
    }
    
    func testOrderingRequestString() throws {
        let input = ",42,,"
        let orderedString = APIBuilder().orderingRequestString(from: input)
        XCTAssertEqual(orderedString, "42")
    }

    func testOrderingRequestStringWithInvalidInput() throws {
        let input = ",,42,,"
        let orderedString = APIBuilder().orderingRequestString(from: input)
        XCTAssertNotEqual(orderedString, ",42,")
    }

    func testCreateLinkForTriviaRequestFailure() throws {
        let type = NumberFactType.trivia(requestedNumber: "42")
        let expectedUrl = APIBuilder().createLinkForRequest(type: type)
        XCTAssertNotEqual(expectedUrl, "http://numbersapi.com/42/fact")
    }
        
    func testCreateLinkForRangeRequestFailure() throws {
        let type = NumberFactType.range(min: "10", max: "20")
        let expectedUrl = APIBuilder().createLinkForRequest(type: type)
        XCTAssertNotEqual(expectedUrl, "http://numbersapi.com/random?min=10&max=30")
    }
}
