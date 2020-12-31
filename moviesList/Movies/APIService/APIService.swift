
import Foundation

class APIService :  NSObject {
    
    private let moviesURL = URL(string: "https://api.androidhive.info/json/movies.json")!
    
    func apiToGetMoviesData(completion : @escaping ([Movie]) -> ()){
        URLSession.shared.dataTask(with: moviesURL) { (data, urlResponse, error) in
            if let data = data {
                do{
                    let movies = try JSONDecoder().decode(Array<Movie>.self, from: data)
                    
                    completion(movies)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
