//
//  WeatherHeaderView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct WeatherHeaderView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State private var search = " "
    
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .padding(.leading, 20)
                .foregroundColor(.white)
            
            Button {
                weatherViewModel.city = search
                search = " "
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Image(systemName: "arrow.forward")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

