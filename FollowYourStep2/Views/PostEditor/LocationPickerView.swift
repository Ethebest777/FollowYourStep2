//
//  LocationPickerView.swift
//  Test
//
//  Created by admin on 2024/11/19.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocationPickerView: View {
    @Binding var selectedCoordinate: CLLocationCoordinate2D
    @Environment(\.presentationMode) var presentationMode
    @State private var location = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // 默认位置，后续改成当前位置
    
    var body: some View {
        VStack {
            Map {
                Marker("Pick Location", coordinate: selectedCoordinate)
            }
            .onChange(of: location) {
                    let newCoordinate = location
                    selectedCoordinate = newCoordinate
                }
                .edgesIgnoringSafeArea(.all)
            
            Button("Confirm Location") {
                selectedCoordinate = location
                presentationMode.wrappedValue.dismiss() // 选择完位置后返回上一页面
            }
            .padding()
        }
    }
}

extension CLLocationCoordinate2D: @retroactive Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

