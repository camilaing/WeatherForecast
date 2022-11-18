//
//  BlurredBackgroundView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 16/11/2022.
//

import SwiftUI

struct BlurredBackgroundView: View {
    
    var body: some View {
        Rectangle()
            .padding(-10)
            .foregroundColor(Color(red: 0.4627, green: 0.8392, blue: 1.0).opacity(0.3))
            .blur(radius: 20)
    }
    
    var gradient: some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 0.4627, green: 0.8392, blue: 1.0).opacity(0.3), Color.blue, Color(red: 0.4627, green: 0.8392, blue: 1.0).opacity(0.3)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
    }
}

struct BlurredBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BlurredBackgroundView()
    }
}
