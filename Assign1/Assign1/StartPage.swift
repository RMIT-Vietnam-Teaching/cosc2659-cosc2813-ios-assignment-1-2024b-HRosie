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

struct StartPageView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom )
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    Image("reverend")
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:100)
                        .foregroundColor(.yellow)
                        .padding(.bottom,20)
                    
                    Text("Wychwood")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.bottom,10)
                    
                    Text("To the places we have been")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom,10)
                    
                    NavigationLink(destination: ContentView()
                        .navigationBarBackButtonHidden(true)) {
                        Text("Start")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: 300)
                            .foregroundColor(.cyan)
                            .cornerRadius(10)
                            .shadow(radius: 5)

                    }
                    
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    

            }
            VStack {
                Spacer()
                
                HStack {
                    
                    Spacer()
                    .frame(width: 310)
                    
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "info")
                            .foregroundColor(.cyan)
                        //.position(x: 340, y: 440)
                    }
                    
                    .alert("Personal Detail", isPresented: $showingAlert) {
                        Button("Ok", role: .cancel) { }
                    } message: {
                        Text("Nguyen Tien Minh Quan \n s3931082 \n Software Engineering")
                    }
                }
                .padding(10)
                }
                
            }
        }
    }
}

#Preview {
    StartPageView()
}
