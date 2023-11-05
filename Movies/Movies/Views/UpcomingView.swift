import SwiftUI

struct UpcomingView: View {
    var body: some View {
        VStack {
            Text("UPCOMING")
                .font(.system(size: 40, weight: .bold, design: .serif))
                .foregroundStyle(.red)
            Spacer()
        }
        .foregroundStyle(.white)
        .background{
            Image("gambino")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}

#Preview {
    UpcomingView()
}
