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

    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    private var initialCoordinateSpan: MKCoordinateSpan?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMapView()

        locationManager.requestWhenInUseAuthorization()

        mapView?.userTrackingMode = .follow
    }

    private func setupMapView() {
        mapView.delegate = self

        mapView.showsUserLocation = true
        mapView.mapType = .standard

        mapView.showsTraffic = true
        mapView.showsBuildings = true


//        mapView.showsScale = true
//        mapView.showsCompass = true //default true
    }

    @IBAction func backToUserLocation(_ sender: UIButton) {
        let userRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: initialCoordinateSpan ?? mapView.region.span)
        mapView.setRegion(userRegion, animated: true)
    }

    @IBAction func zoomIn(_ sender: Any) {
        let latitudeDelta = mapView.region.span.latitudeDelta * 0.5
        let longitudeDelta = mapView.region.span.longitudeDelta * 0.5
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        print("------zoomIn---",span)
        mapView.setRegion(region, animated: true)
    }

    @IBAction func zoomOut(_ sender: Any) {
        let latitudeDelta = mapView.region.span.latitudeDelta * 2
        let longitudeDelta = mapView.region.span.longitudeDelta * 2
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension ViewController: MKMapViewDelegate {
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("---mapViewDidChangeVisibleRegion---", mapView.region.span)
    }

    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if initialCoordinateSpan == nil {
            initialCoordinateSpan = mapView.region.span
        }
        print("-----mapViewDidFinishLoadingMap---", mapView.region.span)
    }

    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("---regionDidChangeAnimated---", mapView.region.span)
    }

//    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let identifier = "pinAnnotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
//
//        if annotationView == nil {
//            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView?.canShowCallout = true
//        } else {
//            annotationView?.annotation = annotation
//        }
//
//        return annotationView
//    }
}
