//
//  ViewController.swift
//  mdleypunskiyPW1
//
//  Created by Maksim on 12.09.2021.
//
// UIColorExtension.swift is an addition file, where
// UIColor extension to hex-codes and
// random hex-code generator are present.
//
// Sorry if english is bad =)
//
// Also there is one easter egg (push on second view from the top left).

import UIKit

// Flag to show alert once on loading.
var wasAlertShown = false

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !wasAlertShown
        {
            // Creating alert object.
        let alert = UIAlertController(title: "Alert!", message: "This programm contains easter eggs)))", preferredStyle: UIAlertController.Style.alert)
            // Adding "Ok" button to allow user to hide notification.
        alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertAction.Style.default, handler: nil))
            // Showing notification on screen.
        self.parent?.present(alert, animated: true)
            
            wasAlertShown = true
        }
        
        for view in views{
            view.layer.cornerRadius = 15
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        
        let button = sender as? UIButton
        button?.isEnabled = false
        
        var set = Set<UIColor>()
        
        while set.count < views.count {
            set.insert(UIColor.init(hex: randomHexColorString())!)
        }
        
            UIView.animate(withDuration: 2, animations: {
                for view in self.views {
                    view.backgroundColor = set.popFirst()
                }
            })
            { completion in button?.isEnabled = true}
        
    }
}
