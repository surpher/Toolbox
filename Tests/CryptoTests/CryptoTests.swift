import XCTest

@testable import Crypto

final class CryptoTests: XCTestCase {

    private var testBundle: Bundle!
    private var fileURL: URL!

    override func setUp() {
        super.setUp()

        testBundle = Bundle.module

        guard let fileURL = testBundle.url(forResource: SHATestFile.name, withExtension: SHATestFile.extension) else {
            XCTFail("Could not find \(SHATestFile.name).\(SHATestFile.extension) in test bundle.")
            return
        }
        self.fileURL = fileURL
    }

    func testCalculatesSHA256() throws {
        // Given
        let expectedResult = SHATestFile.sha265

        // When
        let result = try Crypto.getSHA(for: fileURL, algorithm: .sha256)

        // Then
        XCTAssertEqual(expectedResult, result)
    }

    func testCalculatesSHA384() throws {
        // Given
        let expectedResult = SHATestFile.sha384

        // When
        let result = try Crypto.getSHA(for: fileURL, algorithm: .sha384)

        // Then
        XCTAssertEqual(expectedResult, result)
    }

    func testCalculatesSHA512() throws {
        // Given
        let expectedResult = SHATestFile.sha512

        // When
        let result = try Crypto.getSHA(for: fileURL, algorithm: .sha512)

        // Then
        XCTAssertEqual(expectedResult, result)
    }
}

// MARK: - Private

private extension CryptoTests {

    enum SHATestFile {
        static let name = "test_file"
        static let `extension` = "txt"

        static let sha265 = "16a88fd85557d789226e6bc4325298e8d9a1955304280e3dfa404ebb336a7858"
        static let sha384 = "97f5831bcc536db9a5ec45b2b9feb739108837a8d7e8f75c6f7818cd0831750c5d9c127b23ab19622d2781b2f5420c0e"
        static let sha512 = "01df0e5fc528c2a76b4ed9d4a9fe335ceece9cf613ea6fe023918245f83ab92e84ae9eed0ac00445084a79fada2ee7b6d1ffe9a30b411180dc7016bf48ee992b"
    }
}
