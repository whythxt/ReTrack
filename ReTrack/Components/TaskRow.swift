//
//  TaskRow.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var done: Bool

    var body: some View {
        HStack(spacing: 20) {
            Label(task, systemImage: done ? "checkmark.circle" : "circle")
                .font(.title3)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "breathe", done: true)
    }
}
