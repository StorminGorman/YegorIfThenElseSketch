# YegorIfThenElseSketch

This is a couple of sketches ([overloading](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/TalkOverloaded.swift),
[visitor](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/TalkVisitor.swift))
I put together to illustrate a potential way to eliminate an IfThenElse block with polymorphism and decorators

http://www.yegor256.com/2016/08/10/if-then-else-code-smell.html

According to Yegor this is bad:
```
class DyTalk implements Talk {
	void modify(Collection<Directive> dirs) {
		if (!dirs.isEmpty()) {
			// Apply the modification
			// and save the new XML document
			// to the DynamoDB table.
		}
	}
}
```
I implemented illustrations using simple [method overloading](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/TalkOverloaded.swift) as well as a [visitor pattern](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/TalkVisitor.swift) approach.
The examples are in Swift so here's a couple of reminders for Java programmers:

- Protocols are essentially analogous to Interfaces
- Contructors are init()
- Parameters are given as "variableName: Type"
- Array types are [ObjectType]

I think everything else is pretty self explanatory

Example usage of Vistor code that does not have an if statement:
```
class ExampleUsage {
	var dirs: Collection
	init() {
		dirs = EmptyCollection()
	}

	func add(dir: Dir) {
		dirs.add(dir)
	}

	func talk() {
		dirs.letsHaveATalk(DyTalk())
	}
}
```
