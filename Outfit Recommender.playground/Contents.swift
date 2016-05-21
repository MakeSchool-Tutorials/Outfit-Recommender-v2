/**
 * Outfit Recommender
 * Accompanied by a Cheatsheet
 * Workshop: Intro to Apple's Swift Programming Language
 * Written by Adrian Wisaksana for Make School Singapore
 * Adapted from Outfit Recommender for MIT Blueprint 2015
 * Copyright © 2016 Make School - MakeGamesWithUs Inc
 */

// Importing Foundation is necessary to generate our random numbers.
import Foundation

/**
 * An enum that declares all the possible types of events.
 */
enum EventType {
    
    case Sports
    case Formal
    case Casual
    
}

class OutfitRecommender {
    
    /**
     * A property that stores the event type of the outfit recommender. 
     * This property will be used to determine which outfits to recommend.
     */
    var eventType: EventType
    
    // NOTE: `[:]` is one way to declare an empty dictionary in Swift
    
    /**
     * A dictionary that stores key-value pairs of `EventType` to an array of tops.
     */
    var tops: [EventType: [String]] = [:]
    
    /**
     * A dictionary that stores key-value pairs of `EventType` to an array of bottoms.
     */
    var bottoms: [EventType: [String]] = [:]
    
    init(eventType: EventType) {
        
        self.eventType = eventType
        
        // define tops
        tops[.Sports] = ["Tank Top", "Tennis Shirt", "Jersey"]
        tops[.Formal] = ["Blazer", "Vest", "Dress", "Dress Shirt", "Blouse"]
        tops[.Casual] = ["T-Shirt", "Tank Top", "Hoodie", "Polo Shirt", "Crop Top"]
        
        // define bottoms
        bottoms[.Sports] = ["Soccer Shorts", "Tights", "Tennis Skirt"]
        bottoms[.Formal] = ["Long Pants", "Pencil Skirt"]
        bottoms[.Casual] = ["Jeans", "Bermudas", "Denim Shorts", "Mini Skirt", "Midi Skirt"]
        
    }
    
    /**
     * Returns the possible tops based on the outfit recommender's event type.
     *
     * - returns: An array of tops as Strings
     */
    func getPossibleTops() -> [String] {
        
        guard let tops = tops[eventType] else { return [] }
        
        return tops
        
    }
    
    /**
     * Returns the possible bottoms based on the outfit recommender's event type.
     * 
     * - returns: An array of bottoms as Strings
     */
    func getPossibleBottoms() -> [String] {
        
        guard let bottoms = bottoms[eventType] else { return [] }
        
        return bottoms
        
    }
    
    /**
     * Creates a random integer between 0 and the given `max` value.
     *
     * - returns: A random integer between 0 and the given `max` value.
     */
    func randomNumberFromZeroTo(max: Int) -> Int {
        
        // `arc4random_uniform` is a function imported from the Foundation library
        // We utilise it to generate our random number.
        let randomIndex = Int(arc4random_uniform(UInt32(max)))
        
        return randomIndex
        
    }
    
    /**
     * Prints a possible outfit (a pair of top and bottom) based on the outfit
     * recommender's event type.
     */
    func findPossibleOutfit() -> String {
        
        // possible top
        guard let allTopsForEventType = tops[eventType] else { return "There are no tops for \(eventType)" }
        let randomIndexForTops = randomNumberFromZeroTo(allTopsForEventType.count)
        let possibleTop = allTopsForEventType[randomIndexForTops]
        
        // possible bottom
        guard let allBottomsForEventType = bottoms[eventType] else { return "There are no bottoms for \(eventType)" }
        let randomIndexForBottoms = randomNumberFromZeroTo(allBottomsForEventType.count)
        let possibleBottom = allBottomsForEventType[randomIndexForBottoms]
        
        return "You can wear: \(possibleTop) and \(possibleBottom)"
        
    }
    
}

let outfitRecommender = OutfitRecommender(eventType: .Formal)

let possibleTops = outfitRecommender.getPossibleTops()
print("== POSSIBLE TOPS == ")
possibleTops.forEach { (top) in
    print(top)
}

let possibleBottoms = outfitRecommender.getPossibleBottoms()
print("== POSSIBLE BOTTOMS == ")
possibleBottoms.forEach { (bottom) in
    print(bottom)
}

print("== RECOMMENDATION == ")
let possibleOutfit = outfitRecommender.findPossibleOutfit()
print(possibleOutfit)






