//
//  ViewController.swift
//  Project16
//
//  Created by Ngoni Katsidzira  on 26/6/2025.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // capital objects...
        let capitals: [Capital] = [
            Capital(
                title: "London",
                coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                info: "Home to the 2012 Summer Olympics."
            ),
            Capital(
                title: "Oslo",
                coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75),
                info: "Founded over a thousand years ago."
            ),
            Capital(
                title: "Paris",
                coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508),
                info: "Often called the City of Light."
            ),
            Capital(
                title: "Rome",
                coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5),
                info: "Has a whole country inside it."
            ),
            Capital(
                title: "Washington DC",
                coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667),
                info: "Named after George himself."
            ),
            Capital(
                title: "Harare",
                coordinate: CLLocationCoordinate2D(latitude: -17.831565, longitude: 31.047260),
                info: "The Sunshine City"
            ),
        ]
        
        // add capitals to mapView as annotations...
        for capital in capitals {
            mapView.addAnnotation(capital)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }
        
        // 2
        let identifier = "Capital"
        
        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            // 4
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }


}

