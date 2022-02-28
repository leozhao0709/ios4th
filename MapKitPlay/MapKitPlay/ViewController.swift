//
//  ViewController.swift
//  MapKitPlay
//
//  Created by Lei Zhao on 2/27/22.
//
//

import UIKit
import MapKit


class ViewController: UIViewController {

    private weak var mapView: MKMapView?
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMapView()

        locationManager.requestWhenInUseAuthorization()

        mapView?.userTrackingMode = .follow
    }

    private func setupMapView() {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.frame = view.bounds

        mapView.showsUserLocation = true

        mapView.showsTraffic = true
//        mapView.showsScale = true
//        mapView.showsCompass = true //default true

        view.addSubview(mapView)
        self.mapView = mapView
    }
}

extension ViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("------")

//        mapView.userLocation.title = "123"
//        mapView.userLocation.subtitle = "!23124"
//        guard let location = userLocation.location else { return }
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { placemarks, error in
//            guard let placemarks = placemarks else {
//                print("parse error---")
//                return
//            }
//
//            if placemarks.count == 0 || error != nil {
//                print("parse error")
//                return
//            }
//
//            let placemark = placemarks.last
//
//            // set title to city
//            userLocation.title = placemark?.locality
//            // set subtitle to details
//            userLocation.subtitle = placemark?.name
//        }
    }

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let userLocation = annotation as! MKUserLocation
        let identifier = "pinAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        guard let location = userLocation.location else { return nil}
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemarks = placemarks else {
                print("parse error---")
                return
            }

            if placemarks.count == 0 || error != nil {
                print("parse error")
                return
            }

            let placemark = placemarks.last

            // set title to city
            userLocation.title = placemark?.locality
            // set subtitle to details
            userLocation.subtitle = placemark?.name
        }

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: userLocation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = userLocation
        }

        return annotationView
    }
}