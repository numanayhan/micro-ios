//
//  Project.swift
//  Config
//
//  Created by mba on 24.09.2024.
//
import ProjectDescription

let project = Project(
    name: "TrendSDK",
    organizationName:"na",
    targets: [
        .target(
            name: "TrendSDK",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS("13.0"),
            infoPlist: .default,
            sources: ["TrendSDK/Sources/**"],
            resources: ["TrendSDK/Resources/**"], // kaynaklar ve storyboard
            dependencies: []
        )
    ]
)
