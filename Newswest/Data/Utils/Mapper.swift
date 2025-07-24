import Foundation

extension Data {
    func mapResponse<type: Decodable>(_ structType: type.Type) throws -> type  {
        return try JSONDecoder().decode(structType, from: self)
    }
}
