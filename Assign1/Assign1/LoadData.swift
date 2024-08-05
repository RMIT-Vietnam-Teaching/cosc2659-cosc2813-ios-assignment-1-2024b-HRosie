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

import Foundation

struct DataLoader {
    static func loadPlaces() -> [Place] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Failted to find data.json in the bundle.")
            return[]
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let places = try decoder.decode([Place].self, from: data)
            
            return places
        } catch {
            print("Failted to decode JSON data")
            return[]
        }
    }
}
