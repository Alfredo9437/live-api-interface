//
//  ViewController.swift
//  API interface
//
//  Created by Alfredo Rodriguez-Garcia on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    var firstButton: UIButton!
    var secondButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        //have to loadview first
        super.loadView()
        //make first button
        self.firstButton = UIButton(type: .system)
        self.firstButton.translatesAutoresizingMaskIntoConstraints = false
        self.firstButton.setTitle(
            "First Button",
            for: UIControl.State.normal
        )
        self.firstButton.addTarget(self,
                                   action: #selector(firstButtonClicked(_:)),
                                                     for: UIControl.Event.touchUpInside)
        self.firstButton.addTarget(self,
                                   action: #selector(firstButtonDragExited(_:)),
                                                     for: UIControl.Event.touchDragExit)
        
        
        //make second buttton
        self.secondButton = UIButton(type: UIButton.ButtonType.system)
        self.secondButton.translatesAutoresizingMaskIntoConstraints = false
        self.secondButton.setTitle(
            "Second Button",
            for: UIControl.State.normal
        )
        self.secondButton.frame = CGRect(
            x:10, y:200,
            width: 150, height: 100
        
        )
        self.secondButton.addTarget(self,
                                   action: #selector(secondButtonClicked(_:)),
                                                     for: UIControl.Event.touchUpInside)
        //add the buttons to our prim view
        self.view.addSubview(self.firstButton)
        self.view.addSubview(self.secondButton)
        
        //create the constraint and store to a variable
        //so we can activate later
        //must happen after weve added the buttons to the view
        let b1CenterX = self.firstButton.centerXAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        let b1CenterY = self.firstButton.centerYAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        b1CenterX.isActive = true
        b1CenterY.isActive = true
        

    }


    

    @objc func firstButtonClicked(_ b: UIButton){
        print("First Button Clicked")
    }
    @objc func firstButtonDragExited(_ b: UIButton){
        print("First button dragged")
    }

    
    @objc func secondButtonClicked(_ b: UIButton){
        print("Second Button Clicked")
    }
    
}

