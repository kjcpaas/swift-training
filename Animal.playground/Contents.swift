enum FoodType {
    case plant
    case meat
    
    init() {
        // Food are plant-based by default
        self = .plant
    }
    
    func toString() -> String {
        switch self {
        case .plant: return "plant"
        case .meat: return "meat"
        }
    }
}

enum Diet {
    case omnivore
    case carnivore
    case herbivore
    
    init() {
        // Healthy lifestyle daw
        self = .herbivore
    }
    
    func canEat2(foodType: FoodType) -> Bool {
        switch self {
            case .carnivore:
                switch foodType {
                    case .meat: return true
                    default: return false
                }
            
            case .herbivore:
                switch foodType {
                    case .plant: return true
                    default: return false
                }
        
            case .omnivore: return true
        }
    }
    
    func canEat(foodType: FoodType) -> Bool {
        switch self {
        case .carnivore: return foodType.toString() == "meat"
        case .herbivore: return foodType.toString() == "plant"
        case .omnivore: return true
        }
    }
}

struct Food {
    var name = String()
    var foodType = FoodType()
    
    init(name: String, foodType: FoodType) {
        self.name = name
        self.foodType = foodType
    }
}

// Use class since I want inheritance in the future (para mayaman :P)
class Animal {
    var name: String = "Animal"
    
    init(name: String) {
        self.name = name
    }
    
    var diet: Diet { return Diet() }
    
    func eat(food: Food) {
        if self.diet.canEat2(food.foodType) {
            print("\(name) ate the \(food.name).")
        } else {
            print("\(name) did not eat \(food.name). :(")
        }
    }
}

let animal = Animal(name: "My Animal")
animal.name

class Fish: Animal {
    override var diet: Diet { return Diet.herbivore }
}

class Tiger: Animal {
    override var diet: Diet { return Diet.carnivore }
}

class Human: Animal {
    override var diet: Diet { return Diet.omnivore }
}

let dory = Fish(name: "Dory")
let tigger = Tiger(name: "Tigger")
let jane = Human(name: "Jane")
let pork = Food(name: "pork", foodType: FoodType.meat)
let malunggay = Food(name: "malunggay", foodType: FoodType.plant)

// Eat meat
dory.eat(pork)          // Should NOT eat
tigger.eat(pork)        // Should eat
jane.eat(pork)          // Should eat

// Eat plant
dory.eat(malunggay)     // Should eat
tigger.eat(malunggay)   // Should NOT eat
jane.eat(malunggay)     // Should eat
