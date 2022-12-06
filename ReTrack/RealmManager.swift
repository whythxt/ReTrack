//
//  RealmManager.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var local: Realm?

    @Published private(set) var tasks = [Task]()

    init() {
        openRealm()
        getTasks()
    }

    private func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config

            local = try Realm()
        } catch {
            fatalError("Cannot open Realm: \(error.localizedDescription)")
        }
    }

    private func getTasks() {
        if let local {
            let allTasks = local.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []

            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }

    func addTask(_ title: String) {
        if let local {
            do {
                try local.write {
                    let newTask = Task(value: ["title": title, "completed": false])
                    local.add(newTask)
                    getTasks()
                }
            } catch {
                print("Cannot add new task: \(error.localizedDescription)")
            }
        }
    }

    func updateTask(id: ObjectId, completed: Bool) {
        if let local {
            do {
                let task = local.objects(Task.self).filter(NSPredicate(format: "id == %@", id))

                guard !task.isEmpty else { return }

                try local.write {
                    task[0].completed = completed
                    getTasks()
                }
            } catch {
                print("Cannot update task: \(error.localizedDescription)")
            }
        }
    }

    func deleteTask(id: ObjectId) {
        if let local {
            do {
                let task = local.objects(Task.self).filter(NSPredicate(format: "id == %@", id))

                guard !task.isEmpty else { return }

                try local.write {
                    local.delete(task)
                    getTasks()
                }
            } catch {
                print("Cannot delete task: \(error.localizedDescription)")
            }
        }
    }
}
