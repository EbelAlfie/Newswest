import UIKit

extension UIImageView {
    func loadImage(_ url: String?) {
        guard let stringUrl = url, let imageUrl = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }.resume()
    }
}
