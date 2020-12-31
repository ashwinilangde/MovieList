import UIKit

class MovieCoordinator : BaseCoordinator {
    
    var navigationController: UINavigationController?
    weak var viewController: MoviesViewController?
    
    init(navigationController :UINavigationController?) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = MoviesViewController.instantiate()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showDetailsView(movie: Movie) {
        let viewController = MovieDetailViewController.instantiate()
        viewController.movie = movie
        navigationController?.pushViewController(viewController, animated: true)
    }
}
