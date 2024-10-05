import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
    case customError(String)
}

class NetworkManager {
    private var headers: [String: String] = [:]

    // Initialize the NetworkManager with API key and offset in headers
    init(apiKey: String, offset: Int) {
        headers["apikey"] = apiKey
        headers["offset"] = "\(offset)"
    }
    
    func request<T: Decodable>(url: URL, method: String = "GET", completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // Set default headers
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.customError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        dataTask.resume()
    }
}
