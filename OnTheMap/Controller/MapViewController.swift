
// Map View location

import UIKit
import MapKit

class MapViewController: UIViewController , MKMapViewDelegate {
    
    //-----------------------------------------outlets-----------------------------------------------------------------------

    @IBOutlet weak var mapView: MKMapView!
    
    //-----------------------------------------variabels---------------------------------------------------------------------

    var studentLocationInfoextra : [studentLocation]!{
        return StusentLocationGlobal.sharedInfo.studentLocationGlobalArray
    }
    

    //-----------------------------------------defualt functions that i used ------------------------------------------------

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        desplyigInfoInMapView()
    }
    
    //-----------------------------------------function that i used --------------------------------------------------------

    
    func desplyigInfoInMapView(){
        
        for  student in studentLocationInfoextra{
            //ggitting data
            let latitude = student.latitude
            let longitude = student.longitude
            
            // creat annotation
            let annotation = MKPointAnnotation()
            annotation.title = student.firstName
            annotation.subtitle = student.mediaURL
            
            annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
            self.mapView.addAnnotation(annotation)
            
            // to create the pop up that show the firstName and Link
            self.mapView.delegate = self
            
        }
        
    }
    
    //-----------------------------------------map Functions---------------------------------------------------------------

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annorationView = MKAnnotationView( annotation: annotation, reuseIdentifier: "customannotation")
        annorationView.canShowCallout = true
        annorationView.image = UIImage(named: "placeholder")
        
        return annorationView
    }
    
    //------------------------------------------------
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            let application = UIApplication.shared
           if let linkActivation = view.annotation?.subtitle ?? nil,
            let url = URL(string: linkActivation ), application.canOpenURL(url){
                
                application.open(url, options: [:], completionHandler: nil)
                
            }
        }
    }
    
    
    
    //-----------------------------------------navigation bar Buttons -----------------------------------------------------
    
    @IBAction func addLocation(_ sender: Any) {
        
        performSegue(withIdentifier: "Addlocation" , sender: self)
        
    }
    
    //------------------------------------------------
    
    @IBAction func refreshMap(_ sender: Any) {
        
        let startActivityIndicator = self.ActivityIndicator()

        API.requstStudentLocation { (result, error) in
            startActivityIndicator.stopAnimating()

            if error != nil {
                self.alertTemplate(title: "Error" , message: "No enternet Connection ")
                return
            }
        }
        
    self.mapView.removeAnnotations(self.mapView.annotations)

       mapView.delegate = self

       desplyigInfoInMapView()

    }
    
    //------------------------------------------------
    
    @IBAction func logOut(_ sender: Any) {
        
        API.deletSession { (error) in
            
            if error != nil {
                print ("ther is error in loging in ")
                return
            }
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil )
                self.performSegue(withIdentifier: "LoginViewController", sender: self)
            }
        }
    }
    

}
//-----------------------------------------end-----------------------------------------------------------------------
