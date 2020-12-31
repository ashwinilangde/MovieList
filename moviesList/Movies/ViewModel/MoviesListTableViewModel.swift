
import Foundation
import UIKit

class MoviesListTableViewModel : NSObject {
    private var apiService : APIService!
    private(set) var movieData : [Movie]! {
            didSet {
                self.bindMovieSViewModelToController()
            }
        }
    
    var bindMovieSViewModelToController : (() -> ()) = {}
    
    override init() {
            super.init()
            self.apiService =  APIService()
            callFuncToGetMoviewData()
        }
    
    func callFuncToGetMoviewData() {
            self.apiService.apiToGetMoviesData { (movieData) in
                self.movieData = movieData
            }
        }
}
