//
//  AppSetup.swift
//  Config
//
//  Created by mba on 24.09.2024.
//

import Foundation
import ProjectDescription

public struct AppConfig {
    public let marketingVersion: String
    public let buildVersion: InfoPlist
    public let organizationName: String
    public let bunldePrefix: String
    public let iosTargetVersion: String
    
    public init(
        marketingVersion: String,
        buildVersion: InfoPlist,
        organizationName: String,
        bunldePrefix: String,
        iosTargetVersion: String
    ) {
        self.marketingVersion = marketingVersion
        self.buildVersion = buildVersion
        self.organizationName = organizationName
        self.bunldePrefix = bunldePrefix
        self.iosTargetVersion = iosTargetVersion
    }
}

public enum AppScope: String {
    case root
    case core
    case flow
    
    public var folder: String {
        rawValue.capitalizingFirstLetter
    }
}

extension String {
    var capitalizingFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }
}
