//
//  ContentView.swift
//  Nain-Demo
//
//  Created by ruofan on 2023/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack{
                PictureLoaderView()
            }
        }
    }
}

struct GradientBlurredBackground: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.9), Color.pink.opacity(0.9)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .blur(radius: 15)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
