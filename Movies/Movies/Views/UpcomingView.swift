import SwiftUI

struct UpcomingView: View {
    @StateObject private var viewModel = MoviesViewModel()
    var body: some View {
        VStack {
            Text("UPCOMING")
                .font(.system(size: 40, weight: .bold, design: .serif))
                .foregroundStyle(.red)
            List(viewModel.movies){ movie in
                HStack {
                    Poster(url: movie.posterURL!)
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.system(size: 20, weight: .bold, design: .serif))
                            .foregroundStyle(Color("deepblue"))
                        Text(movie.overview)
                            .lineLimit(3)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color("glassMaterial"))
            }
            .scrollContentBackground(.hidden)
            .background(.clear)
            Spacer()
        }
        .onAppear(perform: {
            viewModel.loadData()
        })
        .background{
            Image("interstellar")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct Poster: View {
    let url: URL
    var body: some View {
        AsyncImage(url: url) { poster in
            poster
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .cornerRadius(5)
        } placeholder: {
            ProgressView()
                .frame(width: 100)
        }
    }
}

#Preview {
    UpcomingView()
}
