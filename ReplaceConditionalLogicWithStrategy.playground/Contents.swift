import UIKit

final class Loan {
    var expiryDate: String?
    var maturityDate: String?
    private var capitalStrategy: CapitalStrategy
    
    private init(capitalStrategy: CapitalStrategy) {
        self.capitalStrategy = capitalStrategy
    }
    
    static func termLoan() -> Loan {
        return self.init(capitalStrategy: TermLoanCapitalStrategy())
    }
    
    static func revolver() -> Loan {
        return self.init(capitalStrategy: RevolverCapitalStrategy())
    }
    
    func capital() -> Double {
        return capitalStrategy.capital(loan: self)
    }
    
    func duration() -> Double {
        return 0.0
    }
    
    func getUnusedPercentage() -> Double {
        return 5.0
    }
}

protocol CapitalStrategy {
    func capital(loan: Loan) -> Double
    func riskFactor() -> Double
}

extension CapitalStrategy {
    func riskFactor() -> Double {
        return 0.0
    }
}

class RevolverCapitalStrategy: CapitalStrategy {
    func capital(loan: Loan) -> Double {
        return 250 * riskFactor()
    }
}

class TermLoanCapitalStrategy: CapitalStrategy {
    func capital(loan: Loan) -> Double {
        if loan.expiryDate != nil && loan.maturityDate != nil {
            return 10.0 * loan.duration() * riskFactor()
        }
        if loan.expiryDate != nil && loan.maturityDate == nil {
            if loan.getUnusedPercentage() > 1.0 {
                return 150.0 * loan.getUnusedPercentage()
            } else {
                return 200.0 * loan.getUnusedPercentage()
            }
        }
        
        return 0.0
    }
}

let user1Loan = Loan.revolver()
let user1Report = user1Loan.capital()
print(user1Report)
