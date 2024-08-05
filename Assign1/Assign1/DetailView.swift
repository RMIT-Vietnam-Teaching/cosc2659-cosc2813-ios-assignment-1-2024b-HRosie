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
import MapKit

struct PlaceDetailView : View {
    let place: Place
    
    @State private var region: MKCoordinateRegion
    
    init(place: Place) {
        self.place = place
        _region = State(initialValue:MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom )
            .edgesIgnoringSafeArea(.all)
            VStack {
                
                Map(coordinateRegion: $region, annotationItems: [place]) { place in MapPin(coordinate:CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude))}
                    .ignoresSafeArea(edges: .top)
                    .frame(height:150)
                
                Image(place.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay( Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                Text(place.name)
                    .font(.largeTitle)
                    .padding()
                
                Text(place.description)
                    .font(.body)
                    .padding()
                
                
                
                Spacer()
            }
            .navigationTitle(place.name)
            .navigationBarTitleDisplayMode(.inline)
        }}
}





