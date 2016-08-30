protocol Collection {
    func letsHaveA(talk: Talk) -> Void
    func values() -> [AnyObject]
    func add(obj: AnyObject) -> Collection
}

class EmptyCollection : Collection {

    func letsHaveA(talk: Talk) -> Void {
        talk.modify(self)
    }
    
    func add(obj: AnyObject) -> Collection {
        var values = [AnyObject]()
        values.append(obj)
        return DefaultCollection(values: values)
    }
    
    func values() -> [AnyObject] {
        return [AnyObject]()
    }
}

class DefaultCollection : Collection {
    let _values: [AnyObject]
    
    init(values: [AnyObject]) {
        self._values = values
    }
    
    func letsHaveA(talk: Talk) -> Void {
        talk.modify(self)
    }
    
    func add(obj: AnyObject) -> NotEmptyCollection {
        var newValues = [AnyObject]()
        newValues.appendContentsOf(_values)
        newValues.append(obj)
        
        return DefaultCollection(values: newValues)
    }
    
    func values() -> [AnyObject] {
        return _values
    }
}

protocol Talk {
    func modify(dirs: EmptyCollection)
    func modify(dirs: Collection)
}

class Silent : Talk {
    func modify(dirs: EmptyCollection) {}
    func modify(dirs: Collection) {}
}

class DyTalk : Silent {
    override func modify(dirs: Collection) {
        // Apply the modification
        // and save the new XML document
        // to the DynamoDB table
    }
}
