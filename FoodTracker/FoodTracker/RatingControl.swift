//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Eduardo Guerra on 19/10/18.
//  Copyright © 2018 Eduardo Guerra. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private methods
    
    private func setupButtons(){
        //Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Add the button as a subview of the stackview
        addArrangedSubview(button)

    }
}
