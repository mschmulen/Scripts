//
//  AssetPack.swift
//  Copyright © 2018 Homer. All rights reserved.
//

import Foundation
//import HomerFoundation

//public struct AssetPack: Constituent {
//
//    public typealias Mapping = [URL : AssetPack]
//    public typealias Storage = Raw
//    public typealias JSONObject = Raw
//    public typealias KeyPathResult = HomerFoundation.Result<AssetPack.Value, KeyPathEvaluationError>
//    public typealias KeyPath = [String]
//    public typealias Key = String
//    public typealias Value = String
//
//    public let url: URL
//    public var name: String { return url.packName }
//    public let constituentName: String
//    internal var rawFields: Raw
//
//    public enum InitializationError: LocalizedError {
//        case missingConstituentField
//        case packURLError(URL.InitializationError)
//
//        public var failureReason: String? {
//            switch self {
//            case .missingConstituentField:
//                return "Missing constituent field"
//            case let .packURLError(error):
//                return "Failed to initialize due to AssetPack.URL error: \(error)"
//            }
//        }
//    }
//
//    public enum KeyPathEvaluationError: Error {
//        case invalidArrayIndex(Key)
//        case noValueFound(forKey: Key, inJSONObject: JSONObject)
//        case noValidCollection(forKey: String, inKeyPath: KeyPath)
//        case incorrectType(forValue: Storage.Value, foundAtKeyPath: KeyPath, inStorage: Storage)
//        case incorrectPack(forURL: URL)
//    }
//
//    public subscript(keyPath: String) -> KeyPathResult {
//        return self[keyPath.split(separator: URL.keySeparator).map(String.init)]
//    }

//    public subscript(keyPath: KeyPath) -> KeyPathResult {
//        var value: Any = rawFields
//        for key in keyPath {
//            if let array = value as? [String] {
//                guard let index = Int(key) else {
//                    return .error(.invalidArrayIndex(key))
//                }
//                value = array[index]
//            }
//            else if let dictionary = value as? JSONObject {
//                guard let newValue = dictionary[key] else {
//                    return .error(.noValueFound(forKey: key, inJSONObject: dictionary))
//                }
//                value = newValue
//            }
//            else {
//                return .error(.noValidCollection(forKey: key, inKeyPath: keyPath))
//            }
//        }
//
//        guard let result = value as? Value else {
//            return .error(.incorrectType(forValue: value, foundAtKeyPath: keyPath, inStorage: rawFields))
//        }
//
//        return .success(result)
//    }

//    public subscript(url: URL) -> KeyPathResult {
//        guard url.isForPack(named: name) else {
//            return .error(KeyPathEvaluationError.incorrectPack(forURL: url))
//        }
//        return self[url.keyPath]
//    }
//
//    public func fieldsDictionary(with transform: (String) -> String) -> Raw {
//        var result = rawFields
//        traverse(json: &result, andApply: transform)
//        return result
//    }
//
//    private func traverse(json: inout Raw, andApply transform: (String) -> String) {
//        for (key, value) in json {
//            if var arrayValue = value as? [Any] {
//                traverse(array: &arrayValue, andApply: transform)
//                json[key] = arrayValue
//            } else if var jsonValue = value as? Raw {
//                traverse(json: &jsonValue, andApply: transform)
//                json[key] = jsonValue
//            } else if let stringValue = value as? String {
//                json[key] = transform(stringValue)
//            }
                // MAS TODO
//            else if let integerValue = value as? Int {
//                // WARN: Not currently doing anything to the integers, not sure if this is correct
//                json[key] = value
//            }
//            else {
//                fatalError("non supported type encountered in json, value: \(value)")
//            }
//        }
//    }
//
//    private func traverse(array: inout [Any], andApply transform: (String) -> String) {
//        for (index, value) in array.enumerated() {
//            if var arrayValue = value as? [Any] {
//                traverse(array: &arrayValue, andApply: transform)
//                array[index] = arrayValue
//            } else if var jsonValue = value as? Raw {
//                traverse(json: &jsonValue, andApply: transform)
//                array[index] = jsonValue
//            } else if let stringValue = value as? String {
//                array[index] = transform(stringValue)
//            }
                // MAS TODO
//            else if let integerValue = value as? Int {
//                // WARN: Not currently doing anything to the integers, not sure if this is correct
//                array[index] = value
//            }
//            else {
//                fatalError("non supported type encountered in json, value: \(value)")
//            }
//        }
//    }
//    
//    internal static func packs(from gapiData: AssetPacksQuery.Data) throws -> Mapping {
//        guard let rawPacks = gapiData.assetPacks else {
//            fatalError("received nil from GAPI for assetpacks field in assetpacks query")
//        }
//        
//        return try rawPacks.reduce(into: Mapping()) { (result, kvPair) in
//            let (name, value) = kvPair
//            guard let gapiData = value as? Raw else {
//                return
//            }
//            let pack = try AssetPack(name: name, gapiData: gapiData)
//            result[pack.url] = pack
//        }
//    }
//    
//    internal init(name: String, gapiData: Raw) throws {
//        let constituentNameKey = "constituent"
//        guard let constituentName = gapiData[constituentNameKey] as? String else {
//            throw InitializationError.missingConstituentField
//        }
//        var rawFields = gapiData
//        rawFields.removeValue(forKey: constituentNameKey)
//        
//        self.url = try URL(packName: name)
//        self.constituentName = constituentName
//        self.rawFields = rawFields
//    }
//    
//}
//
//extension AssetPack: Hashable {
//    public var hashValue: Int {
//        return constituentName.hashValue
//    }
//    
//    public static func == (lhs: AssetPack, rhs: AssetPack) -> Bool {
//        return lhs.constituentName == rhs.constituentName
//    }
//}
