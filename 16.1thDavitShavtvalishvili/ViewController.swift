//
//  ViewController.swift
//  16.1thDavitShavtvalishvili
//
//  Created by დავით შავთვალიშვილი on 19.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name("com.testComp.Notification.colorChange"), object: nil)
    }
    
    func presentVc(int: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.modalPresentationStyle = .fullScreen
        vc.mode = int
        present(vc, animated: true)
    }
    
    @IBAction func redTap(_ sender: Any) {
        print("red")
        presentVc(int: 1)
    }
    @IBAction func blueTap(_ sender: Any) {
        print("blue")
        presentVc(int: 2)
    }
    @IBAction func blackTap(_ sender: Any) {
        print("black")
        presentVc(int: 3)
    }
    @IBAction func purpleTap(_ sender: Any) {
        print("purple")
        presentVc(int: 4)
    }
    
    @objc func changeBackgroundColor(notification: Notification) {
        if let color = notification.userInfo?["color"] as? UIColor {
            view.backgroundColor = color
        }
    }
}
