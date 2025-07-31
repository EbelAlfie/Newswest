import UIKit

extension UIImageView {
    func loadImage(_ url: String?, _ withSize: CGSize? = nil) {
        guard let stringUrl = url,
              let imageUrl = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    guard let image = UIImage(data: response) else { return }
                    
                    if let size = withSize {
                        let renderer = UIGraphicsImageRenderer(size: size)
                        let scaledImage = renderer.image { _ in
                            image.draw(in: CGRect(origin: .zero, size: size))
                        }
                        self.image = scaledImage
                    } else {
                        self.image = image
                    }
                }
            }
        }.resume()
    }
}
