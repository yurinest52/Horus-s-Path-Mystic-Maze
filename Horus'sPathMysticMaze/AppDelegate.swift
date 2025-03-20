import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return horussPathMysticMazeOr
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        horussPathMysticMaze = UIWindow(frame: UIScreen.main.bounds)
        horussPathMysticMaze?.rootViewController = HorussPathFirstLDMysticMazeViewController()
        horussPathMysticMaze?.makeKeyAndVisible()
        return true
    }
    var horussPathMysticMazeOr: UIInterfaceOrientationMask = .portrait
    var horussPathMysticMaze: UIWindow?
}
