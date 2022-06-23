//
//  ResultsScreen.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ResultsScreen: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            CircularProgressView(progress: CGFloat(score) /
             CGFloat(totalQuestions))
             .frame(width: 150, height: 150)
            Text("You got")
            Text("\(score)/\(totalQuestions)")
            if score == 0 {
                Text("Aww man go google a link to watch paw patrol free online (pirating ahem)")
                    .foregroundColor(.white)
                    .padding()
            }
            if score == 1 {
                Text("Aww man go google a link to watch paw patrol free online (pirating ahem)")
                    .foregroundColor(.white)
                    .padding()
            }
            if score == 2{
                Text("You passed, congratulations - but you still kinda suck :/")
                    .foregroundColor(.white)
                    .padding()
            }
            if score == 3{
                Text("THE FATAL FLAW IN YOUR SEEMINGLY COMPLETE KNOWLEDGE HAS SURFACED GO TO THE WIKI AND PATCH IT UP - YOU WERE SO CLOSE TO PERFECTION SIGH")
                    .foregroundColor(.white)
                    .padding()

            }
            if score == 4{
                Text("THE FATAL FLAW IN YOUR SEEMINGLY COMPLETE KNOWLEDGE HAS SURFACED GO TO THE WIKI AND PATCH IT UP - YOU WERE SO CLOSE TO PERFECTION SIGH")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(score: 2, totalQuestions: 3)
    }
}
