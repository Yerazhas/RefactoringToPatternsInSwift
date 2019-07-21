import UIKit

protocol OutputBuilder {
    func addElement(_ id: String)
}

class XMLBuilder: OutputBuilder {
    func addElement(_ id: String) {}
}

class DOMBuilder: OutputBuilder {
    func addElement(_ id: String) {}
}

class RandomTest {}

protocol AbstractRandomTest: class {
    var builder: OutputBuilder! { get set }
    func createBuilder() -> OutputBuilder
    func testAddRoot()
}

extension AbstractRandomTest {
    func testAddRoot() {
        builder = createBuilder()
        builder.addElement("order")
        builder.addElement("expiringDate")
    }
}

class XMLBuilderTest: RandomTest, AbstractRandomTest {
    var builder: OutputBuilder!
    
    func createBuilder() -> OutputBuilder {
        return XMLBuilder()
    }
}

class DOMBuilderTest: RandomTest, AbstractRandomTest{
    var builder: OutputBuilder!
    
    func createBuilder() -> OutputBuilder {
        return DOMBuilder()
    }
}
