//Tabel View

import UIKit

class listOfStuLocations: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //-----------------------------------------outlets-----------------------------------------------------------------------

    @IBOutlet weak var tabelView: UITableView!
    
    //-----------------------------------------variabels---------------------------------------------------------------------

    var studentLocationArray : [studentLocation]!{
        return StusentLocationGlobal.sharedInfo.studentLocationGlobalArray
    }
    
    
    //-----------------------------------------Tabel View Function---------------------------------------------------------------

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.studentLocationArray.count
        
    }
    
    //---------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationResultCell
        
        
        let student = studentLocationArray[indexPath.row]
        
      
        
        cell.PINImage.image = UIImage(named: "placeholder")
        cell.UserFullName.text = "\(student.firstName!) \(student.lastName!)"
        cell.mediaUrl.text = student.mediaURL
    
        
        return (cell)
    }
    
    //---------------------------------------------------------------

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }

    
    //-----------------------------------------navigation bar Buttons ------------------------------------------------
  
    @IBAction func AddLocation(_ sender: Any) {
        
        performSegue(withIdentifier: "Addlocation" , sender: self)

    }
    
    //---------------------------------------------------------------

    
    @IBAction func LogOut(_ sender: Any) {
        
        API.deletSession { (error) in
            
            if error != nil {
                print ("ther is error in loging in ")
                return
            }
            
                self.dismiss(animated: true, completion: nil )
                self.performSegue(withIdentifier: "LoginViewController", sender: self)
        
            
    }
    }
    
    //---------------------------------------------------------------

    @IBAction func Refresh(_ sender: Any) {
        
        tabelView.reloadData()
        
        

    }
    
    
    
}
