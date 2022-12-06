//
//  AddButton.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(.green)

            Text("+")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(height: 50)
        .padding()
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
