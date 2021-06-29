import UIKit

struct Fharenheit {
    var temperature:Double
    init() {
        temperature = 32.0
    }
}
var f = Fharenheit()
print(f)

struct Celcius {
    var tempeartureIncelcius:Double
    init(fromFharenhite fharenhite: Double) {
        tempeartureIncelcius = (fharenhite - 32.0) / 1.8
    }

}
let boilingPointofWater = Celcius(fromFharenhite: 212.0)
print(boilingPointofWater)
