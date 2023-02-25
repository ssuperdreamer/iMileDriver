//
//  ViewController.swift
//  iMileDriver
//
//  Created by Takeshi on 2/22/23.
//

import UIKit
import SnapKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate  {
    
    lazy var mapView = MKMapView()
    lazy var llocationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Home"
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self.view)
            make.center.equalTo(self.view)
        }
        
        
        
        LocationManager.shared.getUserLocaton { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
            
                strongSelf.mapView.setRegion(MKCoordinateRegion(center: location.coordinate,
                                                                span: MKCoordinateSpan(latitudeDelta: 0.7,
                                                                                       longitudeDelta: 0.7)),
                                                            animated: true)
                
                LocationManager.shared.resolveLocationName(with: location) { name in
                    strongSelf.title = name
                }
            }
        }
        
        
    }
    


 

}

