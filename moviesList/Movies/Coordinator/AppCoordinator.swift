import UIKit

class AppCoordinator : BaseCoordinator {
    
    let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        let navigationController = UINavigationController()
        let movieCoordinator = MovieCoordinator(navigationController: navigationController)
        
        self.store(coordinator: movieCoordinator)
        movieCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        movieCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: movieCoordinator)
        }
    }
}
