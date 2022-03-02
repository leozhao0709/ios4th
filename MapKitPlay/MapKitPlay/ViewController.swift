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
        print("------zoomIn---", span)
        mapView.setRegion(region, animated: true)
    }

    @IBAction func zoomOut(_ sender: Any) {
        let latitudeDelta = mapView.region.span.latitudeDelta * 2
        let longitudeDelta = mapView.region.span.longitudeDelta * 2
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: mapView.region.center, span: span)
        mapView.setRegion(region, animated: true)
    }

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let point = touches.first?.location(in: mapView)
        guard let point = point else {
            return
        }
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [self] placemarks, error in
            guard let placemarks = placemarks else {
                print("parse error---")
                return
            }

            if placemarks.count == 0 || error != nil {
                print("parse error")
                return
            }

            let placemark = placemarks.first!
            let annotation = Annotation(coordinate: coordinate, title: placemark.name, subtitle: placemark.locality)
            mapView.addAnnotation(annotation)
        }
    }

}

extension ViewController: MKMapViewDelegate {

    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if initialCoordinateSpan == nil {
            initialCoordinateSpan = mapView.region.span
        }
    }

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            // this is customer location, we should use system's annotation
            return nil
        }

        let identifier = "annotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }

        annotationView?.annotation = annotation
        annotationView?.animatesWhenAdded = true
        annotationView?.markerTintColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.7...1))
        return annotationView
    }
}
