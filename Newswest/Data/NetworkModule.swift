import Foundation

struct NetworkModule {
    private lazy var client = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let client = URLSession(configuration: configuration)
        return client
    }()
    
    func request() {
        
    }
}
