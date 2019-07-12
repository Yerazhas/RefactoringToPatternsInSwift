final class Car {
    var mark: String?
    var wheels: Int?
    var maxSpeed: Double?
    var oil: String?
    
    static func createMarkedCar(mark: String) -> Car {
        return self.init(mark: mark, wheels: nil, maxSpeed: nil, oil: nil)
    }
    
    static func createWheeledCar(wheels: Int) -> Car {
        return self.init(mark: nil, wheels: wheels, maxSpeed: nil, oil: nil)
    }
    
    static func createMaxSpeededAndOiledCar(maxSpeed: Double, oil: String) -> Car {
        return self.init(mark: nil, wheels: nil, maxSpeed: maxSpeed, oil: oil)
    }
    
    static func createOiledCar(oil: String) -> Car {
        return self.init(mark: nil, wheels: nil, maxSpeed: nil, oil: oil)
    }
    
    private init(mark: String?, wheels: Int?, maxSpeed: Double?, oil: String?) {
        self.mark = mark
        self.wheels = wheels
        self.maxSpeed = maxSpeed
        self.oil = oil
    }
}
