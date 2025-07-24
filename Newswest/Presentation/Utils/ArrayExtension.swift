extension Array {
    func getOrNull(_ index: Int) -> Element? {
        return index < self.count ? self[index] : nil
    }
}
