//
//  ImageViewController.swift
//  hW2.10
//
//  Created by Алексей Трофимов on 30.11.2021.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        fetchImage()
    }
    
    func fetchImage() {
        let stringURL = "https://c4.wallpaperflare.com/wallpaper/671/517/187/game-of-thrones-jon-snow-kit-harington-tv-series-wallpaper-preview.jpg"
        guard let imageURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error { print(error); return }
            if let response = response { print(response)}
            
            if let data = data, let image = UIImage(data: data){
                DispatchQueue.main.async {
            
                self.indicator.stopAnimating()
                self.imageView.image = image
            }
            }
        }.resume()
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


