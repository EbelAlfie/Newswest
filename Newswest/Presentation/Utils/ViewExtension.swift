import UIKit

extension UIImageView {
    func loadImage(_ url: String?) {
        guard let stringUrl = url, let imageUrl = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    guard let image = UIImage(data: response) else { return }
                    image.draw(in: CGRect(x: 0, y: 0, width: 5, height: 5))
                    self.image = image
                }
            }
        }.resume()
    }
}
