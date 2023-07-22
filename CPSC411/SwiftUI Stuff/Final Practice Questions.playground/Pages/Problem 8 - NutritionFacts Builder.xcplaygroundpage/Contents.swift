//======================================//
//  Problem 8 - NutritionFacts builder  //
//-----------------------------------------------------------------------------------------------------------------------------------------------//
//  Create a Swift class called nutrition that requires basic food information to be specified when constructed ('calories carbohydrates fat'),  //
//  but allows additional (optional) values to be specified                                                                                      //
//===============================================================================================================================================//

public class NutritionFacts: CustomStringConvertible {
    private final var servingSize: Int
    private final var calories: Int?
    private final var protein: Int?
    
    public var description: String {
        var str: String = "Serving Size: \(servingSize)"
        if let calories = self.calories {
            str += ", Calories: \(calories)"
        }
        if let protein = self.protein {
            str += ", Protein: \(protein)"
        }
        
        return str
    }
    
    init(servingSize: Int) {
        self.servingSize = servingSize
    }
    
    private init(builder: Builder) {
        servingSize = builder.servingSize
        calories = builder.calories
        protein = builder.protein
    }
    
    public class Builder {
        internal final var servingSize: Int
        
        internal final var calories: Int?
        internal final var protein: Int?
        
        init(servingSize: Int) {
            self.servingSize = servingSize
        }
        
        public func calories(_ val: Int) -> Builder {
            calories = val
            return self
        }
        public func protein(_ val: Int) -> Builder {
            protein = val
            return self
        }
        
        public func build() -> NutritionFacts {
            return NutritionFacts(builder: self)
        }
    }
}

var bigMac: NutritionFacts = NutritionFacts.Builder(servingSize: 215)
    .calories(540)
    .build()

var blackBeans: NutritionFacts = NutritionFacts.Builder(servingSize: 172)
    .calories(227)
    .protein(15)
    .build()

print("Big Mac: \(bigMac)")
print("Black Beans: \(blackBeans)")
