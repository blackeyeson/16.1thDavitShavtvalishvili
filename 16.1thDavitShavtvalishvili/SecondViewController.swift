//
//  SecondViewController.swift
//  16.1thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 19.07.22.
//

import UIKit

class SecondViewController: UIViewController {
        
    @IBOutlet var longPressOutlet: UILongPressGestureRecognizer!
    @IBOutlet weak var ViewForGesture: UIView!
    var swipeInt = 0.0
    let screenSize: CGRect = UIScreen.main.bounds
    var alphaVar = 1.0
    var defaultViewSize = CGSize(width: 0, height: 0)

    

    var mode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mode)
        
        defaultViewSize = ViewForGesture.frame.size
        
        switch mode  {
        case 1:
            longPressOutlet.minimumPressDuration = 1
        case 2:
            alphaVar = 0
        case 3:
            addPinch()
            
            let information = ["color": UIColor.red]
            
            NotificationCenter.default.post(name: Notification.Name("com.testComp.Notification.colorChange"), object: 0, userInfo: information)
        case 4:
            print("A")
            swipeInt = 50
        default: print("def")
        }
        print(screenSize.width)
    }
    
    
    
    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shortTap(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func longPress(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.ViewForGesture.alpha = self.alphaVar
        }
    }
    
    @IBAction func swiperight(_ sender: Any) {
        ViewForGesture.frame.size.width += swipeInt
    }
    @IBAction func swipeLeft(_ sender: Any) {
        ViewForGesture.frame.size.width -= swipeInt
    }
    @IBAction func swipeUp(_ sender: Any) {
        ViewForGesture.frame.size.width += swipeInt
    }
    @IBAction func swipeDown(_ sender: Any) {
        ViewForGesture.frame.size.width -= swipeInt
    }
    
    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        ViewForGesture.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        print("zoom")
        gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
        print(gesture.scale)
        gesture.scale = 1
        if ViewForGesture.frame.size.width > screenSize.width {
            ViewForGesture.frame.size = self.defaultViewSize
        }
    }
}
