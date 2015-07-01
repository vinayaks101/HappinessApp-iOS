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
        }
    }
    
    var happiness: Int = 100 {
        //0 to 100, is from sad to happy
        didSet {
            happiness = min(max(0, happiness), 100)
            updateUI()
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilenessForFace(face: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
