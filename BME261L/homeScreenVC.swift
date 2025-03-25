//
//  homeScreenVC.swift
//  BME261L
//
//  Created by vrunda patel on 3/3/25.
//

import UIKit

class homeScreenVC: UIViewController {
    
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var forceView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeView.layer.cornerRadius = 20
        timeView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        timeView.layer.shadowOpacity = 0.8                // Shadow opacity (0 to 1)
        timeView.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow direction and distance
        timeView.layer.shadowRadius = 4                    // Shadow blur radius
        timeView.layer.masksToBounds = false               // Important: allows shadow to extend beyond bounds

        forceView.layer.cornerRadius = 20
        forceView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        forceView.layer.shadowOpacity = 0.8                 // Shadow opacity (0 to 1)
        forceView.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow direction and distance
        forceView.layer.shadowRadius = 4                    // Shadow blur radius
        forceView.layer.masksToBounds = false               // Important: allows shadow to extend beyond bounds

        
        setGradientBackground()

        // Do any additional setup after loading the view.
    }
    
    func setGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1).cgColor, // Baby Blue
            UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1).cgColor  // Lavender
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    // NEED TO UNDERSTAND DATA UPLAOD, HOW DOES BLUETOOTH GET IT TO ME
    // FORMAT IT ALL NICE AND PRETTY 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
