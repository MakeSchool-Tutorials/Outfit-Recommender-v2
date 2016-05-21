//: Playground - noun: a place where people can play


import Foundation

enum EventType {
    
    case Formal
    case Casual
    case Sports
    
}

class OutfitRecommender {
    
    var eventType: EventType
    
    var tops: [EventType: [String]] = [:]
    var bottoms: [EventType: [String]] = [:]
    
    init(eventType: EventType) {
        
        self.eventType = eventType
        
        tops[.Formal] = ["Tuxedo", "Tie", "Fancy Shirt"]
        tops[.Casual] = ["T-Shirt", "Tank Tops", "Hoodies"]
        tops[.Sports] = ["Jersey", "Dry Fit"]
        
        bottoms[.Formal] = ["Long Pants", "Long Skirt"]
        bottoms[.Casual] = ["Jeans", "Shorts"]
        bottoms[.Sports] = ["Tennis Shorts", "Leggings"]
        
    }
    
    func getPossibleTops() -> [String] {
        
        guard let possibleTops = tops[eventType] else {
            return []
        }
        
        // possibleTops will not be nil
        
        return possibleTops
        
    }
    
    func getPossibleBottoms() -> [String] {
        
        guard let possibleBottoms = bottoms[eventType] else {
            return []
        }
        
        return possibleBottoms
        
    }
    
    /**
     * Returns a random number from zero to the given max
     */
    func getRandomNumberFromZeroTo(max: Int) -> Int {
        
        let randomNumber = Int(arc4random_uniform(UInt32(max)))
        
        return randomNumber
        
    }
    
    func getOutfitRecommendation() {
        
        let possibleTops = getPossibleTops()
        let randomPossibleTopIndex = getRandomNumberFromZeroTo(possibleTops.count)
        let possibleTop = possibleTops[randomPossibleTopIndex]
        
        let possibleBottoms = getPossibleBottoms()
        let randomPossibleBottomIndex = getRandomNumberFromZeroTo(possibleBottoms.count)
        let possibleBottom = possibleBottoms[randomPossibleBottomIndex]
        
        let resultString = "I recommend you to wear \(possibleTop) and \(possibleBottom)"
        
        print(resultString)
        
    }
    
}

let outfitRecommender = OutfitRecommender(eventType: .Sports)

//let possibleTops = outfitRecommender.getPossibleTops()
//print(possibleTops)

//let possibleBottoms = outfitRecommender.getPossibleBottoms()
//print(possibleBottoms)

outfitRecommender.getOutfitRecommendation()


// 1. Create Outfit Recommender Class 
// 2. Create EventType enum 
// 3. Define our clothing line
// 4. Implement `getPossibleTops()` method
// 5. Implement `getPossibleBottoms()` method
// 6. Implement `findPossibleOutfit()` method
// 7. Cooler things with Swift

