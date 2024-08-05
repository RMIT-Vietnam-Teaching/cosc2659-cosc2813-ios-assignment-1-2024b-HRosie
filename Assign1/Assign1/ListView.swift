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


struct ListView: View {
    let places: [Place] = DataLoader.loadPlaces()
    var body: some View {
        NavigationView {
            List(places) { place in NavigationLink(destination: PlaceDetailView(place: place)) {
                HStack {
                    Image(place.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment:.leading) {
                        Text(place.name)
                            .font(.headline)
                        Text(place.description)
                            .font(.subheadline)
                    }
                }
            }
        }
            .navigationTitle("Places")
        }
    }
}

#Preview {
    ListView()
}
