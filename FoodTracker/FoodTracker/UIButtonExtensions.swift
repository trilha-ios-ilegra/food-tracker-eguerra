//
//  UIButtonExtensions.swift
//  FoodTracker
//
//  Created by Eduardo Guerra on 19/10/18.
//  Copyright © 2018 Eduardo Guerra. All rights reserved.
//

import UIKit

extension UIButton {
    func addStarButtonConstraints(starSize: CGSize){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
    }
}

extension UIButton {
    func setStarImages(emptyStarImage: UIImage?, filledStarImage: UIImage?, highlightedStarImage: UIImage? ){
        setImage(emptyStarImage, for: .normal)
        setImage(filledStarImage, for: .selected)
        setImage(highlightedStarImage, for: .highlighted)
        setImage(highlightedStarImage, for: [.highlighted, .selected])
    }
}
