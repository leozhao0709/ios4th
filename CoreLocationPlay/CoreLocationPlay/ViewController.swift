//
//  ViewController.swift
//  CoreLocationPlay
//
//  Created by Lei Zhao on 2/27/22.
//
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    private var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        locationManager.delegate = self
//        public let kCLLocationAccuracyBestForNavigation: CLLocationAccuracy
//        public let kCLLocationAccuracyBest: CLLocationAccuracy
//        public let kCLLocationAccuracyNearestTenMeters: CLLocationAccuracy
//        public let kCLLocationAccuracyHundredMeters: CLLocationAccuracy
//        public let kCLLocationAccuracyKilometer: CLLocationAccuracy
//        public let kCLLocationAccuracyThreeKilometers: CLLocationAccuracy
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

        // ask permission
        locationManager.requestWhenInUseAuthorization()

        // if distance exceed 10 meter, then update location
//        locationManager.distanceFilter = 10

        // request location once
//        locationManager.requestLocation()

        locationManager.allowsBackgroundLocationUpdates = true

//        // start update location
        locationManager.startUpdatingLocation()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let loc1 = CLLocation(latitude: 40, longitude: 116)
        let loc2 = CLLocation(latitude: 34, longitude: 109)
        // 直线距离
        let distance = loc1.distance(from: loc2)
        print("---\(distance) meters")
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // we may ask re-request permission again here
        print("---status---", status)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("---lastLocation---", location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
