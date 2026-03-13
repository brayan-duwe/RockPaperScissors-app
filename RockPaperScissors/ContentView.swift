import SwiftUI

struct ContentView: View {
    @State private var choices = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var winTheRound = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer()
                LinearGradient(colors: [.cyan, .blue], startPoint: .leading, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    
                    Image(choices[0])
                    Text(choices[0])
                        .foregroundStyle(Color.white)
                        .font(.headline.weight(.bold))
                    Text(winOrLose())
                        .foregroundStyle(Color.white)
                        .font(.title.weight(.bold))
                    VStack {
                        HStack {
                            ForEach(0..<3) {number in
                                Button {
                                    choiceTapped(number)
                                } label: {
                                    Image(choices[number])
                                        .frame(width: 20, height: 250)
                                        .padding(.horizontal, 46)
                                }
                            }
                            
                        }
                        Spacer()
                        Text("Score: \(score)")
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    
                    
                }
                
                .navigationTitle("Rock, Paper, Scissors")
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
        }
    }
    func winOrLose() -> String {
        if winTheRound == false {
            "Lose the round"
        } else {
            "Win the round"
        }
    }
    
    func choiceTapped(_ number: Int) {

    }
}

#Preview {
    ContentView()
}
