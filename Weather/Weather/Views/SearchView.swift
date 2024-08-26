//
//  SearchView.swift
//  Weather
//
//  Created by Krishna on 26/08/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter city", text: $city, onCommit: {
                viewModel.fetchWeather(for: city)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else if let weather = viewModel.weather {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Temperature: \(weather.main.temp - 273.15, specifier: "%.1f")°C")
                        .font(.headline)
                    
                    Text("Description: \(weather.weather.first?.description ?? "N/A")")
                    
                    if let icon = weather.weather.first?.icon {
                        AsyncImage(url: URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png"))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
                .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            viewModel.loadLastCity()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
