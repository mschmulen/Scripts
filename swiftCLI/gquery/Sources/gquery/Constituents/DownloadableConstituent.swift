////
////  DownloadableConstituent.swift
////  Copyright © 2018 Homer Learning. All rights reserved.
////

import Foundation
//import PromiseKit
//import HomerDownloadService

//public protocol DownloadableConstituent: Constituent {
//    var zipName: String { get }
//
//}
//
//public struct DownloadedConstituent<Constituent: DownloadableConstituent> {
//    public let constituent: Constituent
//    public let resourcesURL: URL
//}
//
//public enum DownloadError: Error {
//    case downloadError(Error)
//    case unknownError
//}
//
//public struct DownloadServicesContainer {
//    public let gapiClient: GAPIClient
//    public let downloadManager: DownloadManager
//    public let downloadedResourcesBaseURL: URL
//    public let embeddedResourcesBaseURL: URL?
//
//    public init(gapiClient: GAPIClient,
//                downloadManager: DownloadManager = .shared,
//                downloadedResourcesBaseURL: URL,
//                embeddedResourcesBaseURL: URL? = nil)
//    {
//        self.gapiClient = gapiClient
//        self.downloadManager = downloadManager
//        self.downloadedResourcesBaseURL = downloadedResourcesBaseURL
//        self.embeddedResourcesBaseURL = embeddedResourcesBaseURL
//    }

//    public static func appContainer(for environment: GAPIClient.Environment) -> DownloadServicesContainer {
//        guard let bundleResourceURL = Bundle.main.resourceURL else { fatalError("app requires resource bundle URL") }
//        let embeddedResourcesBaseURL = bundleResourceURL
//            .appendingPathComponent(.embeddedConstituentResourcesDirectoryName)
//        let embeddedQueryResponsesBaseURL = bundleResourceURL
//            .appendingPathComponent(.embeddedQueryResponsesDirectoryName)
//
//        return .init(
//            gapiClient: GAPIClient(environment: environment,
//                                   cachingMode: .embedded(baseURL: embeddedQueryResponsesBaseURL)),
//            downloadedResourcesBaseURL: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0],
//            embeddedResourcesBaseURL: embeddedResourcesBaseURL)
//    }

//    public func download<Constituent: DownloadableConstituent>
//        (constituent: Constituent)
//        -> Promise<DownloadedConstituent<Constituent>>
//    {
//        return constituent.downloadAndUnzip(with: self)
//    }
//}
//
//public extension DownloadableConstituent {
//
//    func downloadURL(for gapiClient: GAPIClient) -> URL {
//        return gapiClient.environment.cloudfrontBaseURL
//            .appendingPathComponent(constituentName)
//            .appendingPathComponent("zips")
//            .appendingPathComponent(gapiClient.assetSizeProvider.stringForZipDownloadURL)
//            .appendingPathComponent(zipName)
//    }

//    func downloadAndUnzip(with services: DownloadServicesContainer) -> Promise<DownloadedConstituent<Self>> {
//        let remoteURL = downloadURL(for: services.gapiClient)
//
//        // Check if the resources are in an embedded directory provided through the services
//        if let embeddedResourcesRootURL = services.embeddedResourcesBaseURL {
//            let embeddedURL = embeddedResourcesRootURL
//                .appendingPathComponent(remoteURL.lastPathComponent)
//                .deletingPathExtension()
//            guard !FileManager.default.fileExists(atPath: embeddedURL.path) else {
//                return Promise.value(DownloadedConstituent(constituent: self, resourcesURL: embeddedURL))
//            }
//        }
//
//        // Check if the resources have already been downloaded and unzipped
//        let destinationURL = Self.downloadedUnzipDestinationURL(for: remoteURL,
//                                                                relativeTo: services.downloadedResourcesBaseURL)
//        guard !FileManager.default.fileExists(atPath: destinationURL.path) else {
//            return Promise.value(DownloadedConstituent(constituent: self, resourcesURL: destinationURL))
//        }
//
//        return Promise { resolver in
//            let seed = services.downloadManager.download(with: remoteURL)
//            seed.completion { result in
//                switch result {
//                case .success(let zipURL):
//                    let unzipResult = simpleUnzip(zipURL, to: destinationURL)
//                    switch unzipResult {
//                    case .success(let unzippedURL):
//
//                        do {
//                            try FileManager.default.removeItem(at: zipURL)
//                            resolver.fulfill(DownloadedConstituent(constituent: self, resourcesURL: unzippedURL))
//
//                        } catch {
//                            do {
//                                try FileManager.default.removeItem(at: unzippedURL)
//                                resolver.reject(error)
//                            } catch {
//                                print("CRITICAL: Unable to remove unzipped files after failing to delete zip file, space cannot be recovered")
//                                resolver.reject(error)
//                            }
//                        }
//
//                    case .failure(let error):
//                        resolver.reject(error)
//                    }
//
//                case .failure(let error):
//                    resolver.reject(error)
//                }
//            }
//            services.downloadManager.startTask(for: remoteURL)
//        }
//    }
//
//    public static func downloadedUnzipDestinationURL(
//        for zipURL: URL,
//        relativeTo baseURL: URL)
//        -> URL
//    {
//        let fileExtension = zipURL.pathExtension
//        let fileName = zipURL.lastPathComponent
//
//        let directoryName = fileName.replacingOccurrences(of: ".\(fileExtension)", with: "")
//        return baseURL.appendingPathComponent(directoryName, isDirectory: true)
//    }
//
//}
//
//public extension GAPIClient {
//    func cloudfrontURL(for constituent: Constituent) -> URL {
//        return environment.cloudfrontBaseURL
//            .appendingPathComponent(constituent.constituentName)
//    }
//}
//
//public extension String {
//    public static let embeddedConstituentResourcesDirectoryName = "EmbeddedConstituentResources"
//    public static let embeddedQueryResponsesDirectoryName = "EmbeddedQueryResponses"
//}
