 

import UIKit
import MapKit

class AddLocationPart2: UIViewController, MKMapViewDelegate {

    //-----------------------------------------variabels---------------------------------------------------------------------

    
    var stuLocation : studentLocation?
     //-----------------------------------------outlets-----------------------------------------------------------------------
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    //-----------------------------------------default method---------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        showResult()
    }
    
//-----------------------------------------genral methods---------------------------------------------------------------
    
    func showResult(){
        
        guard let location = stuLocation else { return  }
        
        let latitude = location.latitude
        let longitude = location.longitude
        print(latitude)
        print(longitude)
        let cordinte = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)

        // creat annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = cordinte
        annotation.title = location.mapString
        annotation.subtitle = stuLocation?.mediaURL
         mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: cordinte, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
       
        mapView.setRegion(region, animated: true)
        
    }
    
    //-----------------------------------------map Functions---------------------------------------------------------------

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annorationView = MKAnnotationView( annotation: annotation, reuseIdentifier: "customannotation")
        annorationView.canShowCallout = true
        annorationView.image = UIImage(named: "placeholder")
        
        return annorationView
    }
    
    //----------------------------------------

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            let application = UIApplication.shared
            if let linkActivation = view.annotation?.subtitle ?? nil,
                let url = URL(string: linkActivation ), application.canOpenURL(url){
                
                application.open(url, options: [:], completionHandler: nil)
                
            }
        }
    }
    
    //-----------------------------------------gActions button---------------------------------------------------------------------

    @IBAction func ConfirmAdding(_ sender: Any) {
        
        print("enter add location")
        
        guard let location = stuLocation else { return  }
        let cordinte = CLLocationCoordinate2D(latitude: location.latitude!, longitude: location.longitude!)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = cordinte
        
        API.postStudentLocation(link: location.mediaURL!, Cordinate: annotation, locationName: location.mapString!) { (error) in
            
            if error != nil {
                print("nothing saved")
            } else {
                
                print("saved secsuss")
            }
        }
        
    }
    
    //----------------------------------------

    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
