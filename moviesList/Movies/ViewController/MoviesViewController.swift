//
//  MoviesViewController.swift
//  moviesList
//
//  Created by Sagar Gawande on 31/12/20.
//

import UIKit

class MoviesViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var movieData = [Movie]()
    var coordinator: MovieCoordinator?
    private var moviesListTableViewModel: MoviesListTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        title = "Movies"
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.moviesListTableViewModel =  MoviesListTableViewModel()
        self.moviesListTableViewModel.bindMovieSViewModelToController = {
            DispatchQueue.main.async {
                self.movieData = self.moviesListTableViewModel.movieData
                self.tableView.reloadData()
            }
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieName?.text = movieData[indexPath.row].movieName
        cell.movieDate?.text = "\(movieData[indexPath.row].movieReleaseYear)"
        cell.movieImage?.downloaded(from: movieData[indexPath.row].movieImage)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = UIColor.init(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showDetailsView(movie: movieData[indexPath.row])
    }
}

extension MoviesViewController: UISearchDisplayDelegate, UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieData = self.moviesListTableViewModel.movieData.filter({($0.movieName.localizedCaseInsensitiveContains(searchText))})
        tableView.reloadData()
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
