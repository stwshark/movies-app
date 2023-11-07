import Combine
import Foundation

final class MoviesViewModel: ObservableObject {
    @Published private var upcomingMovies: [Movie] = []
    
    @Published var searchQuerry: String = ""
    @Published private var searchResults: [Movie] = []
    
    var movies: [Movie] {
        if searchQuerry.isEmpty {
            return upcomingMovies
        } else {
            return searchResults
        }
    }
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
        $searchQuerry
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .map { searchQuerry in
                searchMovie(for: searchQuerry)
                    .replaceError(with: MovieResponse(results: []))
            }
            .switchToLatest()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .assign(to: &$searchResults)
    }
    
    func loadData(){
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .finished:()
                    case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] upcomingMovies in
                self?.upcomingMovies = upcomingMovies
            }
            .store(in: &cancellable)
    }
}
