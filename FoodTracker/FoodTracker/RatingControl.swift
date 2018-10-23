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
<<<<<<< HEAD

=======
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
<<<<<<< HEAD

=======
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }
<<<<<<< HEAD

=======
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
<<<<<<< HEAD

    //MARK: Button Action

=======
    
    //MARK: Button Action
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
<<<<<<< HEAD

        // Calculate the rating of the selected button
        let selectedRating = index + 1

=======
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
<<<<<<< HEAD

    //MARK: Private methods

    private func setupButtons(){

        let (emptyStar, filledStar, highlightedStar) = loadButtonImages()
        clearAnyExistingButton()


        for index in 0..<starCount {

            let button = UIButton()

            button.setStarImages(emptyStarImage: emptyStar, filledStarImage: filledStar, highlightedStarImage: highlightedStar)

            button.addStarButtonConstraints(starSize: starSize)

            //Setup button action
            button.addTarget(self, action: #selector (RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"

            //Add the button as a subview of the stackview
            addArrangedSubview(button)

=======
    
    //MARK: Private methods
    
    private func setupButtons(){
        
        let (emptyStar, filledStar, highlightedStar) = loadButtonImages()
        clearAnyExistingButton()
        
        
        for index in 0..<starCount {
            
            let button = UIButton()
            
            button.setStarImages(emptyStarImage: emptyStar, filledStarImage: filledStar, highlightedStarImage: highlightedStar)
            
            button.addStarButtonConstraints(starSize: starSize)
            
            //Setup button action
            button.addTarget(self, action: #selector (RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            //Add the button as a subview of the stackview
            addArrangedSubview(button)
            
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()

    }
<<<<<<< HEAD

=======
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    private func loadButtonImages() -> (UIImage?, UIImage?, UIImage?) {
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
<<<<<<< HEAD

        return (emptyStar, filledStar, highlightedStar)
    }

=======
        
        return (emptyStar, filledStar, highlightedStar)
    }
    
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
    private func clearAnyExistingButton() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
    }
<<<<<<< HEAD

    private func updateButtonSelectionStates() {

=======
    
    private func updateButtonSelectionStates() {
        
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
        // Calculate the value string
        let valueString: String
        switch rating {
        case 0:
            valueString = "No rating set."
        case 1:
            valueString = "1 star set."
        default:
            valueString = "\(rating) stars set."
        }
<<<<<<< HEAD

        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating

=======
        
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
<<<<<<< HEAD

=======
            
>>>>>>> a2a137c9011e6eaee8da48c177cc36f12f78656d
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
