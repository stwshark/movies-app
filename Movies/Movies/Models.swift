import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map { URL(string: "https://image.tmdb.org/t/p/w400/\($0)")! }
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
