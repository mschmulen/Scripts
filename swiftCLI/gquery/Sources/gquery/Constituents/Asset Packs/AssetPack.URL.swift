//
//  AssetPack.URL
//  Copyright © 2018 Homer. All rights reserved.
//

import Foundation
//import HomerFoundation

//extension AssetPack {
//    
//    public struct URL {
//        public let packName: String
//        public let keyPath: KeyPath
//        
//        public static let scheme = "pack"
//        public static let packNameRegex = try! NSRegularExpression(pattern: "[a-zA-Z]+", options: [])
//        public static let keyRegex = try! NSRegularExpression(pattern: "([a-zA-Z]+|[0-9]+)", options: [])
//        public static let keySeparator = Character(".")
//        
//        internal init(urlComponents: URLComponents) throws {
//            if let scheme = urlComponents.scheme {
//                guard scheme.lowercased() == URL.scheme else {
//                    throw InitializationError.invalidURLScheme(scheme)
//                }
//            }
//            
//            guard
//                let packName = urlComponents.host,
//                packName.count >= 1
//            else {
//                throw InitializationError
//                    .missingPackName(in: urlComponents.string ?? "URLComponents with nil `string` value")
//            }
//            
//            let keyPath = urlComponents.path.dropFirst().split(separator: URL.keySeparator).map(String.init)
//            try self.init(packName: String(packName), keyPath: keyPath)
//        }
//        
//        internal init(url: Foundation.URL) throws {
//            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
//                throw InitializationError.malformedURL(url.absoluteString)
//            }
//            try self.init(urlComponents: components)
//        }
//        
//        public init(string: String) throws {
//            guard let components = URLComponents(string: string) else {
//                throw InitializationError.malformedURL(string)
//            }
//            try self.init(urlComponents: components)
//        }
//        
//        public init(packName: String, keyPath: KeyPath = []) throws {
//            guard packName.doesMatch(URL.packNameRegex) else {
//                throw InitializationError.invalidPackName(packName)
//            }
//            guard keyPath.allMatch(predicate: { $0.doesMatch(URL.keyRegex) }) else {
//                throw InitializationError.invalidKeyPath(keyPath)
//            }
//
//            self.packName = packName
//            self.keyPath = keyPath
//        }
//
//        private var components: URLComponents {
//            var components = URLComponents()
//            components.scheme = URL.scheme
//            components.host = packName
//            components.path = keyPath.count > 0 ? "/" + keyPath.joined(separator: String(URL.keySeparator)) : ""
//            return components
//        }
//
//        public var foundationURL: Foundation.URL {
//            return components.url!
//        }
//
//        public var absoluteString: String {
//            return components.string!
//        }
//
//        public var sourcePackURL: URL {
//            return try! URL(packName: packName)
//        }
//
//        public func isForPack(named: String) -> Bool {
//            return normalizedPackName == type(of: self).normalize(packName: named)
//        }
//
//    }
//}
//
//extension AssetPack.URL {
//    public enum InitializationError: LocalizedError {
//        case invalidURLScheme(String)
//        case malformedURL(String)
//        case missingPackName(`in`: String)
//        case invalidPackName(String)
//        case invalidKeyPath([String])
//        case tooManyPathComponents([String])
//
//        public var failureReason: String? {
//            switch self {
//            case let .invalidURLScheme(scheme):
//                return "Cannot initialize pack url with any scheme other than 'pack', used: \(scheme)"
//            case let .malformedURL(url):
//                return "Malformed url: \(url)"
//            case let .missingPackName(in: urlString):
//                return "Missing pack name in: \(urlString)"
//            case let .invalidPackName(name):
//                return "Invalid pack name: \(name)"
//            case let .invalidKeyPath(keyPath):
//                return "Invalid keyPath: \(keyPath.joined(separator: String(AssetPack.URL.keySeparator)))"
//            case let .tooManyPathComponents(pathComponents):
//                return "Too many path components: \(pathComponents)"
//            }
//        }
//    }
//}
//
//extension AssetPack.URL: Equatable {
//    public static func ==(lhs: AssetPack.URL, rhs: AssetPack.URL) -> Bool {
//        return lhs.normalizedPackName == rhs.normalizedPackName
//            && lhs.keyPath == rhs.keyPath
//    }
//
//    fileprivate static func normalize(packName: String) -> String {
//        return packName.lowercased()
//    }
//
//    fileprivate var normalizedPackName: String {
//        return packName.lowercased()
//    }
//}
//
//extension AssetPack.URL: Hashable {
//    public var hashValue: Int {
//        let values = [
//            normalizedPackName,
//            keyPath.joined(),
//        ]
//        return values.reduce(into: 0) { result, value in
//            result ^= value.hashValue
//        }
//    }
//}
