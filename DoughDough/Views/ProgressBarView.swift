//
//  StatusBarView.swift
//  DoughDough
//
//  Created by Van Truong on 2/1/24.
//

import SwiftUI

struct ProgressBarView: View {
    let width: CGFloat = 300
    let height: CGFloat = 45
    let cornerRadius: CGFloat = 20
    
    @Binding var percentCompleted: Double
    
    var body: some View {
        let multiplier: Double = width / 100
        
        VStack {
            Text("\(percentCompleted.formatted())% completed")
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.black.opacity(0.1))
                    .frame(width: width, height: height)
                    .padding([.leading, .trailing])
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.orange)
                    .frame(width: percentCompleted * multiplier, height: height)
                    .padding([.leading, .trailing])
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    @State static var percentCompleted: Double = 71.2
    static var previews: some View {
        ProgressBarView(percentCompleted: $percentCompleted)
    }
}
