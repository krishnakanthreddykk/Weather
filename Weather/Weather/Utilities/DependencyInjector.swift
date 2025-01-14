//
//  DependencyInjector.swift
//  Weather
//
//  Created by Krishna on 26/08/24.
//

import Foundation

class DependencyInjector {
    let weatherService: WeatherServiceProtocol
    let locationService: LocationServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService(), locationService: LocationServiceProtocol = LocationService()) {
        self.weatherService = weatherService
        self.locationService = locationService
    }
}
