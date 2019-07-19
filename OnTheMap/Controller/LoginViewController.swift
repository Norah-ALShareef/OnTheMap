
// login Page

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //--------------------------------------------------variables---------------------------------------------

    var studentLocationInfo : [Any] = []

    var studentLocationInfoextra : [studentLocation]!{
        return StusentLocationGlobal.sharedInfo.studentLocationGlobalArray
    }
    
    //-----------------------------------------outlets-----------------------------------------------------------------------

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    //--------------------------------------------------Defualt Functions---------------------------------------------

   
    override func viewWillAppear(_ animated: Bool) {
        EmailTextField.text = ""
        PasswordTextfield.text = ""
    }
//--------------------------------------------------Action Buttons outlet---------------------------------------------
    
    @IBAction func Login(_ sender: Any) {
        
        let act = ActivityIndicator()
        
        print("login")
        
        print("woooo0ooow", +StusentLocationGlobal.sharedInfo.studentLocationGlobalArray.count)

        for  student in studentLocationInfoextra {
            
            print (student.firstName)
            
        }
        
        
        guard let studentEmail = EmailTextField.text?.trimmingCharacters(in: .whitespaces), let Password = PasswordTextfield.text?.trimmingCharacters(in: .whitespaces), !studentEmail.isEmpty, !Password.isEmpty
        
            else {
                
                alertTemplate(title: "Worning", message: "Please enter Email and Password")
                
                print ("some thing went wrong")
                
                return
        }
        API.loginSession(with: studentEmail, password: Password) { ( data , error) in
            
            

              act.stopAnimating()
            
            DispatchQueue.main.async {
                
               
                
            if let error = error {
                
               
                
                self.alertTemplate(title: "Worning", message: "There are No Enternet Connection")
                
                print("there is an error")
                
                return
            }
            
           
                
            if let error = data?["error"] {
                
                self.ActivityIndicator().stopAnimating()

                self.alertTemplate(title: "Worning", message: "invalid Email or Password")
                
            }
            if let session = data?["session"] as? [String: Any], let sessionId = session["id"] as? String {
                print("settion id :)", sessionId)
               
                act.startAnimating()
                API.requstStudentLocation { (result, error) in
                    
                    act.stopAnimating()
                    if error != nil {
                        
                        self.alertTemplate(title: "Worning", message: "There was an error in loding data Please Try again ")
                        
                        print("there was error in loding data ")
                        return
                    }
                    print ([self.studentLocationInfoextra])
                }
                
                     self.performSegue(withIdentifier: "homePage" , sender: self)
                }
               
            }
        }
        
        
        
        
}
    //--------------------------------------------------
    
    @IBAction func SignUp(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://www.udacity.com")!, options: [:], completionHandler: nil)
        
    }
    
//--------------------------------------------------keyboard / textField setup---------------------------------------

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
}

}
//--------------------------------------------------extentions--------------------------------------------------------

extension UIViewController{
    
    func ActivityIndicator()->UIActivityIndicatorView{
        
        let ActivityIndecator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        
        self.view.addSubview(ActivityIndecator)
        self.view.bringSubviewToFront(ActivityIndecator)
        ActivityIndecator.center = self.view.center
        ActivityIndecator.hidesWhenStopped = true
        ActivityIndecator.startAnimating()
        
        return ActivityIndecator
    }
}

//--------------------------------------------------

extension UIViewController{
    
    func alertTemplate(title : String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
