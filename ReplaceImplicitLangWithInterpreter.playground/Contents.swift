import UIKit

class ProductFinder {
    private let products = [Product(id: 0, name: "book", color: .red, size: 12),
                            Product(id: 1, name: "knife", color: .black, size: 7),
                            Product(id: 2, name: "scissor", color: .green, size: 7),
                            Product(id: 3, name: "monitor", color: .black, size: 10),
                            Product(id: 4, name: "processor", color: .black, size: 7)]
    
    func findByColor(_ color : UIColor) -> [Product] {
        let colorSpec = ColorSpec(colorOfProductToFind: color)
        
        return selectBy(spec: colorSpec)
    }
    
    func findByColorAndSmallerSize(_ color: UIColor, _ size: Int) -> [Product] {
        let colorSpec = ColorSpec(colorOfProductToFind: color)
        let smallerSizeSpec = SmallerSizeSpec(sizeThreshold: size)
        let andSpec = AndSpec(augend: colorSpec, addend: smallerSizeSpec)
        
        return selectBy(spec: andSpec)
    }
    
    private func selectBy(spec: Spec) -> [Product] {
        var foundProducts = [Product]()
        for product in products {
            if spec.isSatisfiedBy(product) {
                foundProducts.append(product)
            }
        }
        
        return foundProducts
    }
}

struct Product {
    let id: Int
    let name: String
    let color: UIColor
    let size: Int
}

protocol Spec {
    func isSatisfiedBy(_ product: Product) -> Bool
}

class ColorSpec: Spec {
    private let colorOfProductToFind: UIColor
    
    init(colorOfProductToFind: UIColor) {
        self.colorOfProductToFind = colorOfProductToFind
    }
    
    func getColorOfProductToFind() -> UIColor {
        return colorOfProductToFind
    }
    
    func isSatisfiedBy(_ product: Product) -> Bool {
        return getColorOfProductToFind() == product.color
    }
}

class SmallerSizeSpec: Spec {
    private let sizeThreshold: Int
    
    init(sizeThreshold: Int) {
        self.sizeThreshold = sizeThreshold
    }
    
    func isSatisfiedBy(_ product: Product) -> Bool {
        return product.size < getSizeThreshold()
    }
    
    func getSizeThreshold() -> Int {
        return sizeThreshold
    }
}

class AndSpec {
    private let augend: Spec
    private let addend: Spec
    
    init(augend: Spec, addend: Spec) {
        self.augend = augend
        self.addend = addend
    }
    
    func getAddend() -> Spec {
        return addend
    }
    
    func getAugend() -> Spec {
        return augend
    }
}

extension AndSpec: Spec {
    func isSatisfiedBy(_ product: Product) -> Bool {
        return getAugend().isSatisfiedBy(product) && getAddend().isSatisfiedBy(product)
    }
}

let finder = ProductFinder()
print(finder.findByColor(.red).count)
