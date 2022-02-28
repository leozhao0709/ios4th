//
//  ViewController.swift
//  GeocoderAndDecoder
//
//  Created by Lei Zhao on 2/27/22.
//
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        decode()
    }

    private func decode() {
        let geocoder = CLGeocoder()

        let location = CLLocation(latitude: 40, longitude: 116)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemarks = placemarks else {
                print("parse error---")
                return
            }

            if placemarks.count == 0 || error != nil {
                print("parse error")
                return
            }

            for placemark in placemarks {
                print(placemark.location?.coordinate.latitude)
                print(placemark.location?.coordinate.longitude)
                print(placemark.name)
                print(placemark.postalCode)
            }
        }
    }

    private func code() {
        let geocoder = CLGeocoder()

        let address = "5600 Stevens Creek Blvd"
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let placemarks = placemarks else {
                print("parse error---")
                return
            }

            if placemarks.count == 0 || error != nil {
                print("parse error")
                return
            }

            for placemark in placemarks {
                print(placemark.location?.coordinate.latitude)
                print(placemark.location?.coordinate.longitude)
                print(placemark.name)
                print(placemark.postalCode)
            }
        }
    }

}
