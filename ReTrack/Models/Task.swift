//
//  Task.swift
//  ReTrack
//
//  Created by Yurii on 06.12.2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var completed = false
}
