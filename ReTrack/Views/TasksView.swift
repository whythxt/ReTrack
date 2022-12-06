//
//  TasksView.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realm: RealmManager

    var body: some View {
        VStack {
            Text("My tasks")
                .font(.largeTitle)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

            if !realm.tasks.isEmpty {
                    List {
                        ForEach(realm.tasks, id: \.id) { task in
                            if !task.isInvalidated {
                                TaskRow(task: task.title, done: task.completed)
                                    .onTapGesture {
                                        realm.updateTask(id: task.id, completed: !task.completed)
                                    }
                                    .contextMenu {
                                        Button("Delete", role: .destructive) {
                                            withAnimation {
                                                realm.deleteTask(id: task.id)
                                            }
                                        }
                                    }
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                }

            Spacer()
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
