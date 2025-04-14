//
//  homeScreenVC.swift
//  BME261L
//
//  Created by vrunda patel on 3/3/25.
//

import UIKit
import Foundation

class homeScreenVC: UIViewController {
    
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var forceView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    // Timer simulates incoming force and time data
    var timer: Timer?
    var elapsedTime: Int = 0  // Track full seconds
    var fakeTime: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "-"
        forceLabel.text = "-"
        
        // Aesthetics for the Time UI
        timeView.layer.cornerRadius = 20
        timeView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        timeView.layer.shadowOpacity = 0.8                // Shadow opacity (0 to 1)
        timeView.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow direction and distance
        timeView.layer.shadowRadius = 4                    // Shadow blur radius
        timeView.layer.masksToBounds = false               // Important: allows shadow to extend beyond bounds
        
        // Aesthetics for the Force UI
        forceView.layer.cornerRadius = 20
        forceView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        forceView.layer.shadowOpacity = 0.8                 // Shadow opacity (0 to 1)
        forceView.layer.shadowOffset = CGSize(width: 0, height: 2) // Shadow direction and distance
        forceView.layer.shadowRadius = 4                    // Shadow blur radius
        forceView.layer.masksToBounds = false               // Important: allows shadow to extend beyond bounds

        
        setGradientBackground()
        startFakeData()

    }
    
    // Making a Cute Background
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
    
    // MARK: - FAKE DATA
    
    // For the purpose of the Code Review, ignore this. This was just a way to set up testing data until the hardware is ready.
    func startFakeData() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let fakeForce = Float.random(in: 0...100)
            self.elapsedTime += 1  // Add 1 second every tick

            DispatchQueue.main.async {
                self.forceLabel.text = String(format: "%.2f", fakeForce)
                self.timeLabel.text = "\(self.elapsedTime)"
            }
        }
    }

}
