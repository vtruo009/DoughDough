//
//  StatusBarView.swift
//  DoughDough
//
//  Created by Van Truong on 2/1/24.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 120)
                .foregroundColor(.clear)
                .border(.gray) // may not need
            VStack {
//                RoundedRectangle(cornerRadius: 50)
//                    .stroke(Color.gray, lineWidth: 2)
//                    .fill(Color.orange)
//                    .frame(height: 30)
//                    .padding([.leading, .trailing])
//                    .foregroundColor(.clear)
                Capsule()
                    .stroke(style: .init(lineWidth: 2))
                    .fill(.blue)
                    .frame(height: 30)
                    .padding([.leading, .trailing])
                Circle()
                    .stroke(.red, lineWidth: 20)
                    .fill(Color.orange)
                    .frame(width: 150, height: 150)
                HStack {
                    Spacer()
                    Rectangle()
                        .frame(width: 80, height: 50)
                    Spacer()
                    Rectangle()
                        .frame(width: 80, height: 50)
                    Spacer()
                }
            }
        }
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
