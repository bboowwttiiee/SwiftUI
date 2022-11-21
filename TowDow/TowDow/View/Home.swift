//
//  Home.swift
//  TowDow
//
//  Created by bowtie on 20.11.22.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) var context
    @Environment(\.editMode) var editButton
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(taskModel.currentWeek, id: \.self) { day in
                                VStack(spacing: 10) {
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text(taskModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    
                                    Circle()
                                        .fill(colorScheme == .dark ? Color.black : Color.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                } //: VSTACK
                                .foregroundStyle(taskModel.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(taskModel.isToday(date: day)
                                                 ? (colorScheme == .dark ? .black : .white)
                                                 : Color("AccentColor"))
                                .frame(width: 45, height: 90)
                                .background {
                                    ZStack {
                                        if taskModel.isToday(date: day) {
                                            Capsule()
                                                .fill(Color("AccentColor"))
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                }
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation {
                                        taskModel.currentDay = day
                                    }
                                }
                            } //: FOREACH
                        } //: HSTACK
                        .padding(.horizontal)
                    } //: SCROLL
                    
                    TaskView()
                } header: {
                    HeaderView()
                } //: SECTION
            } //: LVSTACK
        } //: SCROLL
        .ignoresSafeArea(.container, edges: .top)
        .overlay {
            Button {
                taskModel.addNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .padding()
                    .background {
                        ZStack {
                            Circle()
                                .stroke(colorScheme == .dark ? Color.black : Color.white, lineWidth: 2)
                            
                            Circle()
                                .fill(Color("AccentColor"))
                        }
                    }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .sheet(isPresented: $taskModel.addNewTask) {
            taskModel.editTask = nil
        } content: {
            NewTaskView()
                .environmentObject(taskModel)
        }

    }
    
    // MARK: - TASK VIEW
    @ViewBuilder
    func TaskView() -> some View {
        LazyVStack(spacing: 20) {
            DynamicFilteredView(dateToFilter: taskModel.currentDay) { (object: Task) in
                TaskCardView(task: object)
            }
        } //: LVSTACK
        .padding()
        .padding(.top)
    }
    
    // MARK: - TASK CARD VIEW
    @ViewBuilder
    func TaskCardView(task: Task) -> some View {
        HStack(alignment: editButton?.wrappedValue == .active ? .center : .top, spacing: 30) {
            if editButton?.wrappedValue == .active {
                VStack(spacing: 10) {
                    if task.taskDate?.compare(Date()) == .orderedDescending || Calendar.current.isDateInToday(task.taskDate ?? Date()) {
                        Button {
                            taskModel.editTask = task
                            taskModel.addNewTask.toggle()
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Button {
                        context.delete(task)
                        try? context.save()
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                }
            } else {
                VStack(spacing: 10) {
                    Circle()
                        .fill(taskModel.isCurrentHour(
                            date: task.taskDate ?? Date()) ? (task.isCompleted ? .green : Color("AccentColor")) : .clear
                        )
                        .frame(width: 15, height: 15)
                        .background {
                            Circle()
                                .stroke(Color("AccentColor"), lineWidth: 1)
                                .padding(-3)
                        }
                        .scaleEffect(!taskModel.isCurrentHour(date: task.taskDate ?? Date()) ? 0.8 : 1)
                    
                    Rectangle()
                        .fill(Color("AccentColor"))
                        .frame(width: 3)
                } //: VSTACK
            }
            
            VStack {
                VStack(spacing: 10) {
                    HStack(alignment: .top) {
                        Text(task.taskTitle ?? "")
                            .font(.title2.bold())
                        
                        Spacer()
                        Text(task.taskDate?.formatted(date: .omitted, time: .shortened) ?? "")
                    } //: HSTACK
                    
                    HStack(alignment: .top) {
                        Text(task.taskDescription ?? "")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 45)
                        Circle()
                            .fill(
                                !taskModel.isCurrentHour(date: task.taskDate ?? Date())
                                ? .gray.opacity(0.6)
                                : (task.taskPriority == "Low"
                                   ? .yellow
                                   : (task.taskPriority == "Medium"
                                      ? .green
                                      : .red))
                            )
                            .opacity(0.9)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Text(task.taskPriority == "Low" ? "!" : (task.taskPriority == "Medium" ? "!!" : "!!!"))
                                    .font(.headline)
                            }
                    } //: HSTACK
                } //: VSTACK
                
                if taskModel.isCurrentHour(date: task.taskDate ?? Date()) {
                    HStack(spacing: 12) {
                        if !task.isCompleted {
                            Button {
                                task.isCompleted = true
                                try? context.save()
                            } label: {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("AccentColor"))
                                    .padding(10)
                                    .background(colorScheme == .dark ? .black : .white, in: RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        
                        Text(task.isCompleted ? "Marked as Completed" : "Mark Task as Completed")
                            .font(.system(size: task.isCompleted ? 14 : 16, weight: .light))
                            .foregroundColor(task.isCompleted ? .gray : (colorScheme == .dark ? .black : .white))
                            .hLeading()
                    } //: HSTACK
                    .padding(.top)
                }
            } //: VSTACK
            .foregroundStyle(taskModel.isCurrentHour(
                date: task.taskDate ?? Date())
                             ? (colorScheme == .dark ? .black : .white)
                             : (colorScheme == .dark ? .white : .black)
            )
            .padding(taskModel.isCurrentHour(date: task.taskDate  ?? Date()) ? 15 : 0)
            .padding(.bottom, taskModel.isCurrentHour(date: task.taskDate  ?? Date()) ? 0 : 10)
            .hLeading()
            .background {
                Color("AccentColor").opacity(0.9)
                    .cornerRadius(25)
                    .opacity(taskModel.isCurrentHour(date: task.taskDate ?? Date()) ? 1 : 0)
            }
        } //: HSTACK
        .hLeading()
    }
    
    // MARK: - HEADER VIEW
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                
                Text("Today")
                    .font(.largeTitle.bold())
            } //: VSTACK
            .hLeading()
            
            EditButton()
        } //: HSTACK
        .padding()
        .padding(.top, getSafeArea().top)
        .background(colorScheme == .dark ? .black : .white)
    }
}

// MARK: - PREVIEW
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let persistedContainer = PersistenceController.shared.container
        
        ContentView()
            .environment(\.managedObjectContext, persistedContainer.viewContext)
    }
}
