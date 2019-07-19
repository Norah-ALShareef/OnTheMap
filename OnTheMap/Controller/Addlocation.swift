
//ADDlOCATION

import UIKit
import MapKit
import CoreLocation

class Addlocation: UIViewController, UITextFieldDelegate, MKMapViewDelegate {
    
    //-----------------------------------------outlets-----------------------------------------------------------------------

    
    @IBOutlet weak var locationString: UITextField!
    
    @IBOutlet weak var mediaLink: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    //-----------------------------------------variabels---------------------------------------------------------------------

    var studentLocationInfoextra : [studentLocation]!{
        return StusentLocationGlobal.sharedInfo.studentLocationGlobalArray
    }
    
    //-----------------------------------------genral Functions---------------------------------------------------------------------

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    func getCordnate(locationString:String , Completion: @escaping (_ cordinate: CLLocationCoordinate2D?,_ error : Error?)->() ){
        
        let activityIn = ActivityIndicator()
        
        CLGeocoder().geocodeAddressString(locationString) { (placemark, error) in
            
            activityIn.stopAnimating()
            
            guard error == nil else {
                
                self.alertTemplate(title: "error", message: "Can not find your location")
                return
            }
            let locationCordinate = placemark?.first?.location?.coordinate
            print(locationCordinate?.latitude)
            Completion(locationCordinate,nil)
        }
        
        
    }
    
    
    func send(_ stuLocation : studentLocation){
        
        print("ENTER SENT FUNCTION");
        CLGeocoder().geocodeAddressString(stuLocation.mapString!) { (placemark, error) in
            
            //  activityIn.stopAnimating()
            
            guard error == nil else {
                
                self.alertTemplate(title: "error", message: "Can not find your location")
                return
            }
            var locationCordinate = stuLocation
            
            locationCordinate.longitude =  placemark?.first?.location?.coordinate.longitude
            locationCordinate.latitude =  placemark?.first?.location?.coordinate.latitude
            print("longitude")
            print(locationCordinate.longitude)
            
            self.performSegue(withIdentifier: "AddLocationPart2", sender: locationCordinate)
            
            
        }
    }
    //-----------------------------------------gActions button---------------------------------------------------------------------

    @IBAction func Cheking(_ sender: UIButton) {
        
        print("chikingbuttonwas preset")
        
        print("entered the function")
        
        let activityIn = ActivityIndicator()
        
        let location = locationString.text
        let media = mediaLink.text
        
        if location == " " || media == " " {
            
            self.alertTemplate(title: "error", message: "Enter the Location & link Please")
            
            
        } else {
            
            let  newStudentLocation = studentLocation.init(objectId: "", uniqueKey: "", firstName: "", lastName: "", mapString:location, mediaURL: media, latitude: 0.0, longitude: 0.0, createdAt: "")
            
            self.send(newStudentLocation)
            
        }
        
        
        
    }
    
    //-----------------------------------------genralmETHOD---------------------------------------------------------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddLocationPart2" , let nextPage = segue.destination as? AddLocationPart2{
            nextPage.stuLocation = ( sender as! studentLocation)
        }
        
        
    }
    
    //-----------------------------------------map Functions---------------------------------------------------------------

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annorationView = MKAnnotationView( annotation: annotation, reuseIdentifier: "customannotation")
        annorationView.canShowCallout = true
        annorationView.image = UIImage(named: "placeholder")
        return annorationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            let application = UIApplication.shared
            guard let linkActivation = view.annotation?.subtitle, let url = URL(string: linkActivation as! String) else {
                return
            }
            
            application.open(url, options: [:], completionHandler: nil)
        }
    }
    
}


