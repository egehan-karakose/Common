//
//  UIFont-Extention.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 31.05.2022.
//

import Foundation
import UIKit

extension UIFont {
    private enum AppFont: String, CaseIterable {
        
        case regular = "HelveticaNeue"
        case bold = "HelveticaNeue-Bold"
        case boldItalic = "HelveticaNeue-BoldItalic"
        case condensedBlack = "HelveticaNeue-CondensedBlack"
        case condensedBold = "HelveticaNeue-CondensedBold"
        case italic = "HelveticaNeue-Italic"
        case light = "HelveticaNeue-Light"
        case lightItalic = "HelveticaNeue-LightItalic"
        case medium = "HelveticaNeue-Medium"
        case mediumItalic = "HelveticaNeue-MediumItalic"
        case thin = "HelveticaNeue-Thin"
        case thinItalic = "HelveticaNeue-ThinItalic"
        case ultraLight = "HelveticaNeue-UltraLight"
        case ultraLightItalic = "HelveticaNeue-UltraLightItalic"
    }
    
//    public class func configure() {
//        AppFont.allCases.forEach({ register(with: $0.rawValue) })
//        updateTabbarAppereance()
//    }
//
//    // MARK: - Private font registration
//
//    private class func register(with name: String) {
//        let fontPath = Bundle.foundation!.path(forResource: name, ofType: "ttf")
//        let inData = NSData(contentsOfFile: fontPath!)
//        var error: Unmanaged<CFError>?
//        let provider = CGDataProvider(data: inData!)
//        if let font = CGFont(provider!) {
//            CTFontManagerRegisterGraphicsFont(font, &error)
//            if error != nil { fatalError() }
//        }
//    }
    
    private class func updateTabbarAppereance() {
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor(white: 0.57, alpha: 1.0),
            NSAttributedString.Key.font: UIFont.regular(of: 10)
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attrs, for: .normal)
    }
    
    public class func light(of size: CGFloat) -> UIFont {
        return UIFont(name: AppFont.light.rawValue, size: size)!
    }
    
    public class func regular(of size: CGFloat) -> UIFont {
        return UIFont(name: AppFont.regular.rawValue, size: size)!
    }
    
    public class func bold(of size: CGFloat) -> UIFont {
        return UIFont(name: AppFont.bold.rawValue, size: size)!
    }
    
    public class func black(of size: CGFloat = 16) -> UIFont {
        return UIFont(name: AppFont.condensedBlack.rawValue, size: size)!
    }
    
    public class func medium(of size: CGFloat = 16) -> UIFont {
        return UIFont(name: AppFont.medium.rawValue, size: size)!
    }
}
