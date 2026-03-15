import SwiftUI

struct ContentView: View {
    @State private var choices = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var winTheRound = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var showingScore = false
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer()
                LinearGradient(colors: [.cyan, .blue], startPoint: .leading, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    
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
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 300)
                                } .alert(scoreTitle, isPresented: $showingScore){
                                    Button("Continue", action: askQuestion)
                                } message: {
                                    Text(scoreMessage)
                                }
                            }
                        }
                        Spacer()
                        Text("Score: \(score)")
                            .foregroundStyle(Color.white)
                            .font(.headline.weight(.bold))
                            .frame(width: 110, height: 30)
                            .background(Color.cyan)
                            .clipShape(.capsule)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 48, style: .continuous)
                            .fill(.regularMaterial)
                            .ignoresSafeArea(edges: .bottom)
                    }
                }
                .navigationTitle("Rock, Paper, Scissors")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .padding(.top, 50)
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
    
    func askQuestion() {
        choices.shuffle()
        winTheRound.toggle()
    }
    
    func choiceTapped(_ number: Int) {
        let appChoice = choices[0]
        let playerChoice = choices[number]
        
        switch appChoice {
        case "Rock":
            if winTheRound {
                if playerChoice == "Paper" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Paper"
                }
            } else {
                if playerChoice != "Paper" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Scissors or Rock"
                }
            }
            
        case "Paper":
            if winTheRound {
                if playerChoice == "Scissors" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Scissors"
                }
            } else {
                if playerChoice != "Scissors" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Rock or Paper"
                }
            }
            
        case "Scissors":
            if winTheRound {
                if playerChoice == "Rock" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Rock"
                }
            } else {
                if playerChoice != "Rock" {
                    score += 1
                    scoreTitle = "Correct"
                    scoreMessage = "Your score is: \(score)"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "The correct answer is: Paper or Scissors"
                }
            }
            
        default:
            break
        }
        
        showingScore = true
    }
}


#Preview {
    ContentView()
}
