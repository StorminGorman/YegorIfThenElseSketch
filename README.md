# YegorIfThenElseSketch

[This is a sketch](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/Talk.swift) 
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

[The example](https://github.com/StorminGorman/YegorIfThenElseSketch/blob/master/Talk.swift) is in Swift so here's a couple of reminders for Java programmers:

- Protocols are essentially analogous to Interfaces
- Contructors are init()
- Parameters are given as "variableName: Type"
- Array types are [ObjectType]

I think everything else is pretty self explanatory
