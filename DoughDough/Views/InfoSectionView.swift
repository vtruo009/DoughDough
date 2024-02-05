//
//  StatusBarView.swift
//  DoughDough
//
//  Created by Van Truong on 2/1/24.
//

import SwiftUI

struct InfoSectionView: View {
    let width: CGFloat = 220
    let height: CGFloat = 30
    let cornerRadius: CGFloat = 20
    
    @Binding var totalTime: Duration
    @Binding var percentage: Double
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 85, height: 85)
                    .foregroundColor(.gray.opacity(0.3))
                Text("\(totalTime.formattedDuration(style: .vertical))").multilineTextAlignment(.center)
            }
            VStack {
                Text("\(percentage.formatted(.percent)) completed")
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.black.opacity(0.1))
                        .frame(width: width, height: height)
                        .padding([.leading, .trailing])
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.orange)
                        .frame(width: percentage * width, height: height)
                        .padding([.leading, .trailing])
                }
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    @State static var totalTime = Duration(hour: 4, minute: 14)
    @State static var percentage = round(0.6666666666 * 100) / 100
    
    static var previews: some View {
        InfoSectionView(totalTime: $totalTime, percentage: $percentage)
    }
}
