import SwiftUI

struct BrickButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed) // Update the animation modifier

    }
}
