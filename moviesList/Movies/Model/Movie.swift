

// MARK: - MovieData
struct Movie: Decodable {
    let movieName, movieImage: String
    let movieRating: Float
    let movieReleaseYear: Int
    let movieGenre: [String]

    enum CodingKeys: String, CodingKey {
        case movieName = "title"
        case movieImage = "image"
        case movieRating = "rating"
        case movieReleaseYear = "releaseYear"
        case movieGenre = "genre"
    }
}
