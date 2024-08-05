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

struct MapView: View {
    let places: [Place]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.68, longitude: 35.58), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1 )
    )
    @State private var selectedPlace: Place? = nil
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places) { place in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)) {
            VStack {
                Image(place.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        selectedPlace = place
                    }
                Text(place.name)
                    .font(.caption)
                    .foregroundColor(.primary)
            }
            .padding(5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 5)
        }
        }
        .ignoresSafeArea()
        .sheet(item: $selectedPlace) { place in PlaceDetailView(place: place)}
        .onAppear {
            if let firstPlace = places.first {
                region.center = CLLocationCoordinate2D(latitude: firstPlace.coordinate.latitude, longitude: firstPlace.coordinate.longitude)
                region.span = MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
            }
        }
    }
}
