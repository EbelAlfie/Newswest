extension String? {
    func replaceIfNull(defaultValue: String = "") -> String {
        return self != nil ? self! : defaultValue
    }
}

extension Int? {
    func replaceIfNull(defaultValue: Int = 0) -> Int {
        return self != nil ? self! : defaultValue
    }
}
