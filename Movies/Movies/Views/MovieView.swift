import SwiftUI

struct MovieView: View {
    var body: some View {
        VStack{
            Spacer()
            Title(title: "THE MOVIES")
            Text("by: Stanislau Astashenka")
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundStyle(Color.white)
            Spacer()
        }
        .background{
            Image("prisoners")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MovieView()
}
