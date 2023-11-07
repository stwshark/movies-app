import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Title(title: "THE MOVIES")
                
                VStack(spacing: 20) {
                    NavigationLink(destination: UpcomingView()) {
                        CustomNavigationTitle(text: "Upcoming movies")
                    }
                    NavigationLink(destination: MovieView()) {
                        CustomNavigationTitle(text: "Best rated")
                    }
                    NavigationLink(destination: MovieView()) {
                        CustomNavigationTitle(text: "Search")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .background{
                Image("joker3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct CustomNavigationTitle: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 20, weight: .bold, design: .serif))
                .foregroundStyle(.white)
            Spacer()
            Text("->")
                .font(.system(size: 20, weight: .bold, design: .serif))
                .foregroundStyle(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("deepblue"))
        }
    }
}

public struct Title: View {
    let title: String
    public var body: some View {
        Text(title)
            .font(.system(size: 40, weight: .bold, design: .serif))
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
