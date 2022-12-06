//
//  ContentView.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realm = RealmManager()

    @State private var showingSheet = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realm)

            AddButton()
                .onTapGesture {
                    showingSheet.toggle()
                }
        }
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .sheet(isPresented: $showingSheet) {
            AddView()
                .environmentObject(realm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
