//
//  GlobalFunctions.swift
//  Common
//
//  Created by Egehan Karaköse on 17.04.2023.
//

import Foundation
public func globalNavigationController(_ base: UIViewController?) -> UINavigationController? {
    if let navigationController = base?.navigationController {
        return navigationController
    } else if let navigationController = getTopMostViewController()?.navigationController {
        return navigationController
    }
    return nil
}

public func attributedText(withString string: String, boldString: String) -> NSAttributedString {
    let fontDescriptor = UIFontDescriptor(name: "SFProDisplay-Bold", size: 16.0)
    let attributedString = NSMutableAttributedString(string: string,
                                                 attributes: [NSAttributedString.Key.font: UIFont(descriptor: fontDescriptor,
                                                                                                  size: fontDescriptor.pointSize)])
    let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontDescriptor.pointSize)]
    let range = (string as NSString).range(of: boldString)
    attributedString.addAttributes(boldFontAttribute, range: range)
    return attributedString
}

public func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController,
                                     desiredControllerType: AnyClass? = nil) -> UIViewController? {
    
    if let type = desiredControllerType, let base = base, base.isKind(of: type) {
        return base
    }
    
    if let nav = base as? UINavigationController {
        if desiredControllerType != nil {
            return getTopMostViewController(base: nav.viewControllers.last, desiredControllerType: desiredControllerType)
        } else {
            return getTopMostViewController(base: nav.visibleViewController, desiredControllerType: desiredControllerType)
        }
    }
    if let tab = base as? UITabBarController {
        if let selected = tab.selectedViewController {
            return getTopMostViewController(base: selected, desiredControllerType: desiredControllerType)
        }
    }
    if let presented = base?.presentedViewController {
        return getTopMostViewController(base: presented, desiredControllerType: desiredControllerType)
    }
    return base
}

public var currentDeviceHasNotch: Bool? {
    return AppDefaults.shared.retrieveFlag(with: .isDeviceHasNotch)
}

public func generateQRCode(from string: String, scale: CGFloat = 3) -> UIImage? {
    let data = string.data(using: String.Encoding.ascii)

    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: scale, y: scale)

        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
    }

    return nil
}

public var token: String {
    (System.shared.getToken())~
}
