import Combine
import Foundation

final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    var cancellable = Set<AnyCancellable>()
    
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
            } receiveValue: { [weak self] movies in
                self?.movies = movies
            }
            .store(in: &cancellable)
    }
}
