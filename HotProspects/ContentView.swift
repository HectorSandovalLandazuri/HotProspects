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

struct ContentView: View {
    @State private var selectedTab = "One"
    var body: some View {
        TabView (selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
    
}

#Preview {
    ContentView()
}
