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

        mapView?.userTrackingMode = .followWithHeading
    }

    private func setupMapView() {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.frame = view.bounds

        mapView.showsUserLocation = true
        mapView.mapType = .standard

        mapView.showsTraffic = true
        mapView.showsBuildings = true
        mapView.showsPointsOfInterest = true
//        mapView.showsScale = true
//        mapView.showsCompass = true //default true

        view.addSubview(mapView)
        self.mapView = mapView
    }
}

extension ViewController: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        let identifier = "pinAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}