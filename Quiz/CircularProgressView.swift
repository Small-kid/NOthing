//
//  CircularProgressView.swift
//  Quiz
//
//  Created by Wong Jun heng on 23/6/22.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: CGFloat
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth:20)
                .opacity(0.4)
                .foregroundColor(.black)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth:20.0, lineCap: .round ,
                    lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
