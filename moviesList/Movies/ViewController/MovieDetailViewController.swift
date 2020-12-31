
import UIKit

class MovieDetailViewController: UIViewController, Storyboarded {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDate?.text = "Release Year: \(movie?.movieReleaseYear ?? 0)"
        movieRating?.text = "Rating: \(movie?.movieRating ?? 0)"
        movieName?.text = movie?.movieName
        movieImage.downloaded(from: movie?.movieImage ?? "")
    }
}
