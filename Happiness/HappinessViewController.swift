//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Vinayak Srivastava on 30/06/15.
//  Copyright (c) 2015 Vinayak Srivastava. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scaleGesture:"))
            // The : is required after function name in action to specify that this fucntion will be expecing arguments
        }
    }
    
    var happiness: Int = 100 {
        //0 to 100, is from sad to happy
        didSet {
            happiness = min(max(0, happiness), 100)
            updateUI()
        }
    }
    
    private struct Constants {
        static let HappinessScale: CGFloat = 4
    }
    
    @IBAction func changeHappinessOnPan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
                
            }
        default: break
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilenessForFace(face: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
