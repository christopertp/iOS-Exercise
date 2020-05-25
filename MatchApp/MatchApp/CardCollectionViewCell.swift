//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Christoper on 19/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        // Keep track of the card that gets passed in
        self.card = card
        
        if (card.isMatched) {
            // If the card has been matched, then make the image views invisible
            backImageView.alpha = 0
            fontImageView.alpha = 0
            return
        } else {
            // If the card hasn't been matched, then make the image views visible
            backImageView.alpha = 1
            fontImageView.alpha = 1
        }
        
        fontImageView.image = UIImage(named: card.imageName )
        
        // Determine if the card is in a flipped up state or flipped down state
        if (card.isFlipped) {
            // Make sure the frontImageView on top
            UIView.transition(
                from: backImageView,
                to: fontImageView,
                duration: 0,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: nil
            )
        } else {
            // Make sure the backImageView on top
            UIView.transition(
                from: fontImageView,
                to: backImageView,
                duration: 0,
                options: [.transitionFlipFromRight, .showHideTransitionViews],
                completion: nil
            )
        }
    }
    
    func flip () {
        UIView.transition(
            from: backImageView,
            to: fontImageView,
            duration: 0.2,
            options: [.transitionFlipFromLeft, .showHideTransitionViews],
            completion: nil
        )
    }
    
    func flipBack() {
        DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + 0.5) {
            UIView.transition(
                from: self.fontImageView,
                to: self.backImageView,
                duration: 0.2,
                options: [.transitionFlipFromRight, .showHideTransitionViews],
                completion: nil
            )
        }
        
    }
    
    func remove() {
        // Remove both imageviews from being visible
        backImageView.alpha = 0
        
        // Animate it
        UIView.animate(
            withDuration: 0.3,
            delay: 0.5,
            options: .curveEaseOut,
            animations: { self.fontImageView.alpha = 0 },
            completion: nil)
    }
    
}
