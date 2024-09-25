import UIKit
import TrendSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Launch()
        window?.makeKeyAndVisible()
        
        if NetworkConnect.isConnected() {
            print("IsConnected")
        }
        return true
    
    }
}
