//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Eduardo Guerra on 19/10/18.
//  Copyright © 2018 Eduardo Guerra. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0{
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var startSzie: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private methods
    
    private func setupButtons(){
        
        let (emptyStar, filledStar, highlightedStar) = loadButtonImages()
        clearAnyExistingButton()
        
        
        for index in 0..<starCount {
            
            let button = UIButton()
            
            setButtonImages(button: button, emptyStarImage: emptyStar, filledStarImage: filledStar, highlightedStarImage: highlightedStar)
            
            addButtonConstraints(button: button)
            
            //Setup button action
            button.addTarget(self, action: #selector (RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            //Add the button as a subview of the stackview
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()

    }
    
    private func loadButtonImages() -> (UIImage?, UIImage?, UIImage?){
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        return (emptyStar, filledStar, highlightedStar)
    }
    
    private func clearAnyExistingButton(){
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
    }
    
    private func addButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: startSzie.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: startSzie.width).isActive = true
    }
    
    private func setButtonImages(button: UIButton, emptyStarImage: UIImage?, filledStarImage: UIImage?, highlightedStarImage: UIImage? ){
        button.setImage(emptyStarImage, for: .normal)
        button.setImage(filledStarImage, for: .selected)
        button.setImage(highlightedStarImage, for: .highlighted)
        button.setImage(highlightedStarImage, for: [.highlighted, .selected])
    }
    
    private func updateButtonSelectionStates() {
        
        // Calculate the value string
        let valueString: String
        switch (rating) {
        case 0:
            valueString = "No rating set."
        case 1:
            valueString = "1 star set."
        default:
            valueString = "\(rating) stars set."
        }
        
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
