//
//  AddView.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var realm: RealmManager

    @State private var title = ""

    var isDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        VStack {
            Text("Create a new task")
                .font(.title2)
                .bold()

            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .padding()

            Spacer()

            Button {
                realm.addTask(title)
                dismiss()
            } label: {
                Text("Save")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        Rectangle()
                            .cornerRadius(30)
                            .foregroundColor(isDisabled ? .gray : .green)
                            .frame(width: 200, height: 60)
                    }
            }
            .disabled(isDisabled ? true : false)
        }
        .padding()
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(RealmManager())
    }
}
