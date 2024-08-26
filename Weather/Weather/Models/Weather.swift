//
//  Weather.swift
//  Weather
//
//  Created by Krishna on 26/08/24.
//

import Foundation

// Weather Model
struct WeatherResponse: Codable {
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let icon: String
        let description: String
    }
}

// Error Handling
enum WeatherError: Error {
    case invalidURL
    case noData
    case decodingError
}
