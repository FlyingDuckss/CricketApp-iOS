//
//  Extensions.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit

extension UIColor {
    /// Initializes a bicolor from a hex string.
    /// - Parameters:
    ///   - hexString: The hex string representing the first color (e.g., "#FF5733").
    ///   - secondHexString: The hex string representing the second color (e.g., "#33FF57").
    /// - Returns: A tuple containing the two UIColor instances.
    static func bicolor(from hexString: String, and secondHexString: String) -> (UIColor, UIColor)? {
        guard let color1 = UIColor(hexString: hexString),
              let color2 = UIColor(hexString: secondHexString) else {
            return nil
        }
        return (color1, color2)
    }

    /// Initializes UIColor from a hex string.
    /// - Parameter hex: The hex string (e.g., "#FF5733").
    convenience init?(hexString: String) {
        var hex = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }

        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)

        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension UIButton {
    func initBtnUI() {
        self.layer.cornerRadius = 10
    }
}


extension UIViewController {
    
    /// Navigate to another view controller.
    /// - Parameter viewController: The view controller to navigate to.
    /// - Parameter animated: Whether the transition should be animated.
    /// - Parameter completion: An optional completion handler to be called after the transition.
    func navigate(to viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        // Optionally, you can push the view controller on a navigation stack
        if let navigationController = self.navigationController {
            navigationController.pushViewController(viewController, animated: animated)
        } else {
            // Present the view controller modally
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: animated, completion: completion)
        }
    }
    
    
    func showAlert(title: String, desc: String) {
        let alert = UIAlertController(title: title, message: desc, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

