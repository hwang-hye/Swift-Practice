//
//  MapViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 6/3/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MKMapViewDelegate {
    
    static let identifier = "MapViewController"
    
    @IBOutlet var mapView: MKMapView!
    
    let picker = UIPickerView()
    let list = ["영등포 캠퍼스", "도봉 캠퍼스", "성북 캠퍼스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        let center = CLLocationCoordinate2D(latitude: 37.51772547542243, longitude: 126.88628413705581)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = center
        annotaion.title = "SeSAC 영등포캠퍼스"
        
        mapView.addAnnotation(annotaion)
        mapView.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
}
