//======================================================================================================================//
//  Problem 11: Study the code below, that specifies a Pizzeria Protocol, makePizza(), and its Extension, makeBasil(),  //
//  and a struct PizzeriaUno that implements both of these Functions.                                                   //
//  If two pizza factories are created, what will printing these instances show?                                        //
//======================================================================================================================//

struct Pizza: CustomStringConvertible {
    let toppings: [String]
    var description: String {
        var str: String = "Pizza w/: "
        
        for top in toppings {
            str += "\(top) "
        }
        
        return str
    }
}

protocol Pizzeria {
    func makePizza(toppings: [String]) -> Pizza
}
extension Pizzeria {
    func makeBasil() -> Pizza {
        return makePizza(toppings: ["tomato", "mozzarella"])
    }
}

struct PizzeriaUno: Pizzeria {
    func makePizza(toppings: [String]) -> Pizza {
        return Pizza(toppings: toppings)
    }
    
    func makeBasil() -> Pizza {
        return makePizza(toppings: ["tomato", "basil", "mozzarella"])
    }
}

let pizzeriaUno: Pizzeria = PizzeriaUno()
let pizzeriaDos: PizzeriaUno = PizzeriaUno()

var pizzaUno: Pizza = pizzeriaUno.makeBasil()
var pizzaDos: Pizza = pizzeriaDos.makeBasil()

print(pizzaUno)
print(pizzaDos)

//------------//
//  Solution  //
//------------//
//  Pizza w/: tomato mozzarella
//  Pizza w/: tomato basil mozzarella
