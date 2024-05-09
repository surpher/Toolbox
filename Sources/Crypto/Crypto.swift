import Foundation
import CryptoKit

public enum Crypto {

    /// SHA hash function
    public enum Algorithm {
        case sha256
        case sha384
        case sha512
    }

    /// Calculates checksum of a given resource
    ///
    /// - Parameters:
    ///   - fileURL: Path to the resource
    ///   - algorithm: Hash algorithm to use
    public static func getSHA(for fileURL: URL, algorithm: Algorithm) throws -> String {
        let fileHandle = try FileHandle(forReadingFrom: fileURL)
        defer {
            fileHandle.closeFile()
        }

        var hashFunction = algorithm.hashFunction
        let bufferSize = 1024 * 1024 // 1MB buffer

        while autoreleasepool(
            invoking: {
                let data = fileHandle.readData(ofLength: bufferSize)
                if data.isEmpty == false {
                    hashFunction.update(data: data)
                    return true
                } else {
                    return false
                }
            }
        ){}

        let digest = hashFunction.finalize()
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}

// MARK: - Internal

internal extension Crypto.Algorithm {

    var hashFunction: any HashFunction {
        switch self {
            case .sha256:
                return SHA256()
            case .sha384:
                return SHA384()
            case .sha512:
                return SHA512()
        }
    }
}
