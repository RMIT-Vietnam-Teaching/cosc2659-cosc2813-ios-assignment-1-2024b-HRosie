/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tien Minh Quan
  ID: s3931082
  Created  01/08/2024
  Last modified: 05/08/2024
  Acknowledgement: StackOverflow
*/

import SwiftUI

struct ContentView: View {
    let places: [Place] = DataLoader.loadPlaces()
    
    var body: some View {
            TabView {
                ListView()
                    .tabItem { Label("List", systemImage: "list.dash") }
                
                MapView(places: places)
                    .tabItem { Label("Map", systemImage: "map") }
            }
        }
}

#Preview {
    ContentView()
}
