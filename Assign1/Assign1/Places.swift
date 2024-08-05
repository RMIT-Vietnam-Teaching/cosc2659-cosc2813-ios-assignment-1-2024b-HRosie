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

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

struct Place: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let image: String
    let coordinate: Coordinate
    
}
