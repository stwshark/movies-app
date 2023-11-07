import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive: Bool = false
    @State private  var size = 0.8
    @State private var opacity = 0.6
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()
                Greeting()
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                Spacer()
            }
            .background{
                Image("prisoners")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct Greeting: View {
    var body: some View {
        Title(title: "THE MOVIES")
        Text("by: Stanislau Astashenka")
            .font(.system(size: 20, weight: .regular, design: .serif))
    }
}

#Preview {
    SplashScreenView()
}
