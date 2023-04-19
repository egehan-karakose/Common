//
//  UIColor+Extention.swift
//  DareDicecommon
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 31.05.2022.
//

import UIKit

extension UIColor {
    public static let appPinkBackground: UIColor = UIColor(named: "appPinkBackground", in: .common, compatibleWith: nil) ?? .systemPink
    public static let appPurpleBackground: UIColor = UIColor(named: "appPurpleBackground", in: .common, compatibleWith: nil) ?? .systemPurple
    public static let appMainBackgroundColor: UIColor = UIColor(named: "appMainBackgroundColor", in: .common, compatibleWith: nil) ?? .systemBackground
    public static let appYellowBackground: UIColor = UIColor(named: "appYellowBackground", in: .common, compatibleWith: nil) ?? .systemYellow
    public static let appGreenBackground: UIColor = UIColor(named: "appGreenBackground", in: .common, compatibleWith: nil) ?? .systemGreen
    public static let appButtonBlue: UIColor = UIColor(named: "appButtonBlue", in: .common, compatibleWith: nil) ?? .blue
    public static let appLightGreen: UIColor = UIColor(named: "appLightGreen", in: .common, compatibleWith: nil) ?? .green
    public static let appDarkGreen: UIColor = UIColor(named: "appDarkGreen", in: .common, compatibleWith: nil) ?? .green
    public static let appLightPink: UIColor = UIColor(named: "appLightPink", in: .common, compatibleWith: nil) ?? .systemPink
    public static let appDarkPink: UIColor = UIColor(named: "appDarkPink", in: .common, compatibleWith: nil) ?? systemPink
    
    public static let boldFontColor: UIColor = UIColor(named: "boldFontColor", in: .common, compatibleWith: nil) ?? .black
    
    public static let labelBackground: UIColor = UIColor(named: "labelBackground", in: .common, compatibleWith: nil) ?? .white
    
    public static let appBlack1: UIColor = UIColor(named: "appBlack1", in: .common, compatibleWith: nil) ?? .black
    public static let appBlack2: UIColor = UIColor(named: "appBlack2", in: .common, compatibleWith: nil) ?? .black
    public static let appDisableGray: UIColor = UIColor(named: "appTextDarkGray", in: .common, compatibleWith: nil) ?? .gray
    public static let appTextGray: UIColor = UIColor(named: "appTextGray", in: .common, compatibleWith: nil) ?? .gray
    public static let appTextBlack: UIColor = UIColor(named: "appTextBlack", in: .common, compatibleWith: nil) ?? .black
    public static let appBoldTextBlack: UIColor = UIColor(named: "appBoldTextBlack", in: .common, compatibleWith: nil) ?? .black
    public static let appWhiteBackground: UIColor = UIColor(named: "appWhiteBackground", in: .common, compatibleWith: nil) ?? .white
    public static let textViewPinkBackground: UIColor = UIColor(named: "textViewPinkBackground", in: .common, compatibleWith: nil) ?? .white
    public static let appMainDarkBackground: UIColor = UIColor(named: "appMainDarkBackground", in: .common, compatibleWith: nil) ?? .systemBackground
    public static let appPink2: UIColor = UIColor(named: "appPink2", in: .common, compatibleWith: nil) ?? .systemBackground
    
    
    public convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        guard hexString.hasColorRepresentation() else { return nil }
        
        let valueText = hexString.replacingOccurrences(of: "#", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        let value = UInt(valueText, radix: 16) ?? 0
        self.init(rgb: value, alpha: alpha)
    }
    
}

extension String {
    func hasColorRepresentation() -> Bool {
        let colorRegex = "(?:#)?([0-9A-Fa-f]{6})"
        return range(of: colorRegex, options: .regularExpression) != nil
    }
}


