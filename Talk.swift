protocol Collection {
    func values() -> [AnyObject]
}

protocol EmptyCollection : Collection {
    func add(obj: AnyObject) -> NotEmptyCollection
}

protocol NotEmptyCollection : Collection {
    func add(obj: AnyObject) -> NotEmptyCollection
}

class DefaultEmptyCollection : EmptyCollection {
    func add(obj: AnyObject) -> NotEmptyCollection {
        var values = [AnyObject]()
        values.append(obj)
        return DefaultCollection(values: values)
    }
    
    func values() -> [AnyObject] {
        return [AnyObject]()
    }
}

class DefaultCollection : NotEmptyCollection {
    let _values: [AnyObject]
    
    init(values: [AnyObject]) {
        self._values = values
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
    func modify()
}

class DontTalk : Talk {
    func modify() {} // do nothing
}

class QuickTalk : Talk {
    let origin: Talk
    init(empty: EmptyCollection) {
        origin = DontTalk()
    }
    init(dirs: NotEmptyCollection) {
        origin = DyTalk(dirs: dirs)
    }
    
    func modify() {
        origin.modify()
    }
}

class DyTalk : Talk {
    let dirs: Collection
    init(dirs: Collection) {
        self.dirs = dirs
    }
    
    func modify() {
        // Apply the modification
        // and save the new XML document
        // to the DynamoDB table
    }
}