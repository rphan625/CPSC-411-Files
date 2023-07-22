//=================================//
//  Problem 1: Barstow Themometer  //
//=================================//

import UIKit

class Thermometer: CustomStringConvertible {
    private var temperature: Int = 0
    private var name: String
    private var minTemp: Int = 29
    private var tempStep: Int = 10
    
    public var description: String {
        var temperatureTemp: Int = temperature
        
        var str: String = ""
        
        while temperatureTemp > self.minTemp {
            str += "+-----+\n"
            str += String(format: "| %3d |\n", temperatureTemp)
            
            if temperatureTemp % self.tempStep != 0 {
                temperatureTemp -= (temperatureTemp % self.tempStep)
            } else {
                temperatureTemp -= self.tempStep
            }
        }
        
        str += "+-----+\n"
        
        return str
    }
    
    init(name: String) {
        self.name = name
    }
    
    func registerTemp(temp: Int) {
        self.temperature = temp
        print("\(name)'s Temperature is now: \(temp) degrees")
    }
}

let barstow = Thermometer(name: "Barstow")
barstow.registerTemp(temp: 139)
print(barstow.description)
