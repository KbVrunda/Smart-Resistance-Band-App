//
//  ChartViewController.swift
//  BME261L
//
//  Created by vrunda patel on 3/22/25.
//

import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
