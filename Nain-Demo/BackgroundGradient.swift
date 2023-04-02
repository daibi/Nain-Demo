//
//  BackgroundGradient.swift
//  Nain-Demo
//
//  Created by ruofan on 2023/3/23.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 0.98, green: 0.87, blue: 0.89), Color(red: 0.88, green: 0.86, blue: 0.98)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}
