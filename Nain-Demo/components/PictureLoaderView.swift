//
//  PictureLoaderView.swift
//  Nain-Demo
//
//  Created by ruofan on 2023/3/23.
//

import SwiftUI
import web3swift

import SwiftUI
import web3swift

struct PictureLoaderView: View {
    @State private var image: Image? = Image("default")
    @State private var isLoading: Bool = false
    @State private var isPressed: Bool = false // Track button press state
    
    
    
    var body: some View {
        GeometryReader { geometry in
            let frameHeight = geometry.size.height * 0.5
            let frameWidth = geometry.size.width - 32 // Subtract the padding (16 * 2)
            
            VStack {
                // Picture and button area
                VStack {
                    // Picture loader component
                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width - 32, height: (geometry.size.height * 0.5) - 32)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .rotation3DEffect( // Add a 3D rotation effect
                            Angle(degrees: -10), // Change the rotation angle to -10 for a right incline
                            axis: (x: -0.5, y: -1.0, z: 0.0),
                            anchor: .bottom,
                            anchorZ: 0.0,
                            perspective: 0.2
                        )
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 8) // Add a shadow effect below the component
                        .padding(16) // Add reasonable padding
                    
                    // Horizontal scrolling row of buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            // Button 1: Change Weather
                            Button(action: {
                                changeWeather()
                            }) {
                                Text("Change Weather")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .buttonStyle(BrickButtonStyle(color: pastelColor(index: 0)))
                            
                            // Button 2: See Request
                            Button(action: {
                                seeRequest()
                            }) {
                                Text("Find your Discounts")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .buttonStyle(BrickButtonStyle(color: pastelColor(index: 1)))
                        }
                        .padding()
                    }
                }
                .frame(height: geometry.size.height * 0.5)
                .frame(height: frameHeight)
                
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }
    }
    
    
    func loadImageBasedOnResultData(data: Int) {
        
    }
    
    // Function to generate pastel colors for the buttons
    private func pastelColor(index: Int) -> Color {
        let colors: [Color] = [
            Color(red: 0.91, green: 0.63, blue: 0.67),
            Color(red: 0.55, green: 0.79, blue: 0.92),
            Color(red: 1.0, green: 0.84, blue: 0.72),
            Color(red: 0.63, green: 0.91, blue: 0.79),
            Color(red: 0.76, green: 0.74, blue: 0.93)
        ]
        return colors[index % colors.count]
    }
    
    // Add the functions for the button actions
    private func changeWeather() {
        // Perform the action for changing the weather
        // Add your web3.swift code to interact with the smart contract here.
        // When the contract call is finished and you have the result data,
        // update the image based on the data result.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let resultData = 1 // Replace with actual result data from the smart contract.
            loadImageBasedOnResultData(data: resultData)
            isLoading = false
        }
    }
    
    private func seeRequest() {
        // Perform the action for viewing the request
    }
}

struct PictureLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        PictureLoaderView()
    }
}

