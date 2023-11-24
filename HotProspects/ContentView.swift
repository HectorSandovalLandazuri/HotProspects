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

struct ContentView: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}



#Preview {
    ContentView()
}
