import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("THE MOVIES")
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .foregroundStyle(.red)
                NavigationLink(destination: UpcomingView()) {
                    VStack{
                        Text("Upcoming movies")
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
            .background{
                Image("joker3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    ContentView()
}
