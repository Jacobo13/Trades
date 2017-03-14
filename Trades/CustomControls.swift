//
//  CustomControls.swift
//  Trades
//
//  Created by Programación Daniel on 14/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit

func animate() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.duration = 0.5
    animation.values = [-15.0, 15.0, -12.5, 12.5, -10, 10, -7.5, 7.5, -5, 5, -2.5, 2.5, 0]
    animation.keyTimes = [0, 0.25, 0.35, 0.45, 0.55, 0.65, 0.75, 0.65, 0.55, 0.45, 0.35, 0.25, 0]

}
