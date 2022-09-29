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
    var secondButtonLeadingCon: NSLayoutConstraint!
    
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
        self.secondButton = UIButton(type: UIButton.ButtonType.infoDark)
        self.secondButton.translatesAutoresizingMaskIntoConstraints = false
        self.secondButton.setTitle(
            "Second Button",
            for: UIControl.State.normal
        )
        self.secondButton.backgroundColor = UIColor.cyan
        self.secondButton.addTarget(self,
                                   action: #selector(secondButtonClicked(_:)),
                                                     for: UIControl.Event.touchUpInside)
        //add the buttons to our prim view
        self.view.addSubview(self.firstButton)
        self.view.addSubview(self.secondButton)
        
        //create the constraint and store to a variable
        //so we can activate later
        //must happen after weve added the buttons to the view
        let b1TrailingCon = self.firstButton.trailingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: -20
        )
        let b1TopCon = self.firstButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        b1TrailingCon.isActive = true
        b1TopCon.isActive = true
        
        //second button constraints
        //making it into a member value will allow access to this function thru out the application
        self.secondButtonLeadingCon = self.secondButton.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: 20
        )
        let b2TopCon = self.secondButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        self.secondButtonLeadingCon.isActive = true
        b2TopCon.isActive = true

    }


    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //
        var offset: Double = self.view.frame.width
        offset /= 4
        
        //turn of the constraint
        self.secondButtonLeadingCon.isActive = false
        
        self.secondButtonLeadingCon = self.secondButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: offset
        )
        secondButtonLeadingCon.isActive = true
        
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

