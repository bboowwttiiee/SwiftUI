//
//  DynamicFilteredView.swift
//  TowDow
//
//  Created by bowtie on 21.11.22.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View, T>: View where T: NSManagedObject {
    // MARK: - PROPERTIES
    @FetchRequest var request: FetchedResults<T>
    let content: (T) -> Content
    
    init(dateToFilter: Date, @ViewBuilder content: @escaping (T) -> Content) {
        // Predicate to filter current date tasks
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: dateToFilter)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // Filter key
        let filterKey = "taskDate"
        
        // This will fetch tasks between today and tomorrow
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [today, tomorrow])
        
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [.init(keyPath: \Task.taskDate, ascending: false)], predicate: predicate)
        self.content = content
    }
    
    // MARK: - BODY
    var body: some View {
        if request.isEmpty {
            Text("No tasks found!")
                .font(.system(size: 16))
                .fontWeight(.light)
                .offset(y: 100)
        } else {
            ForEach(request, id: \.objectID) { object in
                self.content(object)
            }
        }
    }
}
