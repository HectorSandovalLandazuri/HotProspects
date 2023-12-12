//
//  ContentView.swift
//  HotProspects
//
//  Created by Héctor Manuel Sandoval Landázuri on 10/11/23.
//

import SwiftUI

//@MainActor class User: ObservableObject {
//    @Published var name = "Taylor Swift"
//}
//
//struct EditView: View {
//    @EnvironmentObject var user: User
//
//    var body: some View {
//        TextField("Name", text: $user.name)
//    }
//}
//
//struct DisplayView: View {
//    @EnvironmentObject var user: User
//
//    var body: some View {
//        Text(user.name)
//    }
//}
//
//struct ContentView: View {
//    @StateObject var user = User()
//    
//    var body: some View {
//        VStack {
//            EditView()
//            DisplayView()
//        }
//        .environmentObject(user)
//    }
//}

//struct ContentView: View {
//    @State private var selectedTab = "One"
//    var body: some View {
//        TabView (selection: $selectedTab) {
//            Text("Tab 1")
//                .onTapGesture {
//                    selectedTab = "Two"
//                }
//                .tabItem {
//                    Label("One", systemImage: "star")
//                }
//                .tag("One")
//            
//            Text("Tab 2")
//                .tabItem {
//                    Label("Two", systemImage: "circle")
//                }
//                .tag("Two")
//        }
//    }
//    
//}

//@MainActor class DelayedUpdater: ObservableObject {
//    var value = 0 {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    init() {
//        for i in 1...10 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
//                self.value += 1
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @StateObject var updater = DelayedUpdater()
//
//    var body: some View {
//        Text("Value is: \(updater.value)")
//    }
//}

//struct ContentView: View {
//    @State private var output = ""
//    
//    var body: some View {
//        Text(output)
//            .task {
//                await fetchReadings()
//            }
//    }
//    
//    func fetchReadings() async {
//        let fetchTask = Task { () -> String in
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            return "Found \(readings.count) readings"
//        }
//        let result = await fetchTask.result
//        
////        do {
////            output = try result.get()
////        } catch {
////            output = "Error: \(error.localizedDescription)"
////        }
//        switch result {
//            case .success(let str):
//                output = str
//            case .failure(let error):
//                output = "Error: \(error.localizedDescription)"
//        }
//        
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        Image("example")
//            .interpolation(.none)
//            .resizable()
//            .scaledToFit()
//            .frame(maxHeight: .infinity)
//            .background(.black)
//            .ignoresSafeArea()
//    }
//}

//struct ContentView: View {
//    @State private var backgroundColor = Color.red
//
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .padding()
//                .background(backgroundColor)
//
//            Text("Change Color")
//                .padding()
//                .contextMenu {
//                    Button(role: .destructive) {
//                        backgroundColor = .red
//                    } label: {
//                        Label("Red", systemImage: "checkmark.circle.fill")
//                    }
//                    Button("Green") {
//                        backgroundColor = .green
//                    }
//
//                    Button("Blue") {
//                        backgroundColor = .blue
//                    }
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        List {
//            Text("Taylor Swift")
//                .swipeActions {
//                    Button(role: .destructive) {
//                        print("Deleting")
//                    } label: {
//                        Label("Delete", systemImage: "minus.circle")
//                    }
//                }
//                .swipeActions(edge: .leading) {
//                    Button {
//                        print("Pinning")
//                    } label: {
//                        Label("Pin", systemImage: "pin")
//                    }
//                    .tint(.orange)
//                }
//        }
//    }
//}

//import UserNotifications
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Button("Request Permission") {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("All set!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//
//            Button("Schedule Notification") {
//                let content = UNMutableNotificationContent()
//                content.title = "Feed the cat"
//                content.subtitle = "It looks hungry"
//                content.sound = UNNotificationSound.default
//                
//                // show this notification five seconds from now
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//                
//                // choose a random identifier
//                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//                
//                // add our notification request
//                UNUserNotificationCenter.current().add(request)
//            }
//        }
//    }
//}

//import SamplePackage
//struct ContentView: View {
//    let possibleNumbers = Array(1...60)
//    var results: String {
//        let selected = possibleNumbers.random(7).sorted()
//        let strings = selected.map(String.init)
//        return strings.joined(separator: ", ")
//    }
//    var body: some View {
//        Text(results)
//    }
//}

struct ContentView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospects)
    }
}

#Preview {
    ContentView()
}
