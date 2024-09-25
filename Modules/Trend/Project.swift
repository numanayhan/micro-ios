import ProjectDescription


let debugConfiguration: Configuration = .debug(
    name: "Debug",
    // Add your xcconfig here per environment which will for instance contain your different bundleIds, etc
    xcconfig: .relativeToRoot("Trend/Configurations/Dev/Trend.xcconfig")
)
let testConfiguration: Configuration = .release(
    name: "Test",
    xcconfig: .relativeToRoot("Trend//Configurations/Test/Trend.xcconfig")
)

let releaseConfiguration: Configuration = .release(
    name: "Release",
    xcconfig: .relativeToRoot("Trend/Configurations/Release/Trend.xcconfig")
)

let debugScheme = Scheme.scheme(
    name: "Debug",
    shared:true,
    buildAction: .buildAction(targets: [TargetReference(stringLiteral: "Trend")])
)
let testScheme = Scheme.scheme(
    name: "Test",
    shared:true,
    buildAction: .buildAction(targets: [TargetReference(stringLiteral: "Trend")])
)

let releaseScheme = Scheme.scheme(
    name: "Release",
    shared:true,
    buildAction: .buildAction(targets: [TargetReference(stringLiteral: "Trend")])
)


let settings: Settings =
    .settings(base: [:],
              configurations:
                [ debugConfiguration,
                  testConfiguration,
                  releaseConfiguration,
                ])

let project = Project(
    name: "Trend",
    organizationName:"na",//AppSetup.appConfig.organizationName,
    settings: settings,
    targets: [
        .target(
            name: "Trend",
            destinations: .iOS,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS("13.0"),
            infoPlist: .dictionary([
                "CFBundleName": "$(APP_NAME)",
                "CFBundleVersion": "1",  // Uygulamanın versiyon numarası
                "CFBundleShortVersionString": "0.0.1",  // Kullanıcıya gösterilen versiyon
                "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",  // Bundle ID
                "CFBundleExecutable": "$(EXECUTABLE_NAME)",  // Çalıştırılabilir dosya adı
                "CFBundlePackageType": "$(PRODUCT_BUNDLE_PACKAGE_TYPE)",  // Paket türü
                "UILaunchStoryboardName": "LaunchScreen",  // Launch screen storyboard'u
                "UISupportedInterfaceOrientations": [
                    "UIInterfaceOrientationPortrait"  // Sadece portre modunu destekliyoruz
                ]
                //"UIUserInterfaceIdiom": "Phone"  // Sadece iPhone'u hedefle
                //"UIDeviceFamily": [1]  // Yalnızca iPhone cihazları
            ]),
            sources: ["Trend/Sources/**"],
            resources: ["Trend/Resources/**", "Trend/Sources/**/*.storyboard"],
            //dependencies: [.target(name: "TrendSDK", condition: .none)]
            dependencies: [.sdk(name: "TrendSDK", type: .framework, status: .required, condition: .none)]
            
        ),
        .target(
            name: "TrendSDK",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.na.trendsdk",
            deploymentTargets: .iOS("13.0"),
            infoPlist: .default,
            sources: ["**/TrendSDK/Sources/**"],//sources: ["**/Sources/**"],
            //resources: ["**/Resources/**/*"],
            resources: ["**/TrendSDK/Resources/**"],
            dependencies: []
        )
    ],
    schemes: [debugScheme,testScheme,releaseScheme]
)
