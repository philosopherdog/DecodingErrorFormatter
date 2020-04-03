extension String {
    func repeatFor(_ times: Int) -> String {
        var newString = self

        for _ in 1..<times {
            newString += self
        }

        return newString
    }
}

extension DecodingError {
    func debug() {
        switch self {
        case .keyNotFound(let codingKey, let context): handleKeyNotFound(codingKey: codingKey, context: context)
        default: break
        }
    }

    // MARK: - PRIVATE METHODS

    private func handleKeyNotFound(codingKey: CodingKey, context: Context) {
        print("** DECODING ERROR: KEY NOT FOUND IN HIERARCHY:**\n")

        for (index, codingPath) in context.codingPath.enumerated() {
            print("\("-".repeatFor(index + 1)) \(codingPath.stringValue)")
        }
        print("\("-".repeatFor(context.codingPath.count + 1)) \(codingKey.stringValue)")
    }
}