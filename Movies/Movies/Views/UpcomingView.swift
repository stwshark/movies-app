import SwiftUI

struct UpcomingView: View {
    @StateObject private var viewModel = MoviesViewModel()
    var body: some View {
        VStack(spacing: 5) {
            //Title(title: "UPCOMING")
            List(viewModel.movies){ movie in
                HStack {
                    Poster(url: movie.posterURL!)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.system(size: 20, weight: .bold, design: .serif))
                            .lineLimit(2)
                            .foregroundStyle(Color("deepblue"))
                        Text(movie.overview)
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .lineLimit(4)
                    }
                    .padding(9)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(white: 1, opacity: 0.5))
                        .padding(5)
                )
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(.clear)
        }
        .frame(maxHeight: .infinity)
        .searchable(text: $viewModel.searchQuerry)
        .onAppear(perform: {
            viewModel.loadData()
        })
        .background{
            Image("interstellar")
                .resizable()
                .scaledToFill()
                .blur(radius: 2)
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
