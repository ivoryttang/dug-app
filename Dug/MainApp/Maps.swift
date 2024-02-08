//
//  Maps.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct Maps: View {
    
    var body: some View {
        MapView().ignoresSafeArea(edges:.all).navigationBarBackButtonHidden(true)
    }
}

struct Maps_Previews: PreviewProvider {
    static var previews: some View {
        Maps()
    }
}
