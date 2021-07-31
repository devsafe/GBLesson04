import UIKit
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum boostState {
    case boostOn
    case BoostOff
}

enum loadState {
    case loadFull
    case loadEmpty
}


class Car {
    var brand: String
    var release: Int
    
    init(brand: String, release: Int){
        self.brand = brand
        self.release = release
    }
    func showInfo() {
        print("Машина \(brand) с годом выпуска \(release)")
    }
}


class trunkCar: Car {
    var maxLoad: Int
    var loadState: loadState
    init(brand: String, release: Int, maxLoad: Int, loadState: loadState){
        self.maxLoad = maxLoad
        self.loadState = loadState
        super.init(brand: brand, release: release)
    }
    func loadGoods() {
        loadState = .loadFull
    }
    func unloadGoods() {
        loadState = .loadEmpty
    }
    override func showInfo() {
        print("Тягач \(brand) с годом выпуска \(release) сейчас \(self.loadState == .loadFull ? "загружен полностью" : "пуст")")
    }
}


class sportCar: Car {
    var maxSpeed: Int
    var boostState: boostState
    init(brand: String, release: Int, maxSpeed: Int, boostState: boostState){
        self.maxSpeed = maxSpeed
        self.boostState = boostState
        super.init(brand: brand, release: release)
    }
    func boostOn() {
        boostState = .boostOn
    }
    func boostOff() {
        boostState = .BoostOff
    }
    
    override func showInfo() {
        print("Машина \(brand) с годом выпуска \(release) сейчас \(self.boostState == .boostOn ? "с включенным бустом" : "с выключенным бустом")")
    }
}


var ManTruck = trunkCar(brand: "MAN", release: 2020, maxLoad: 1000, loadState: .loadEmpty)
var BMWCar = sportCar(brand: "BMW", release: 2021, maxSpeed: 300, boostState: .boostOn)

BMWCar.boostOff()
ManTruck.loadGoods()

BMWCar.showInfo()
ManTruck.showInfo()
