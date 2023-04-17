//
//  Extentions.swift
//  DareDiceFoundation
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 31.05.2022.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self,
                                 tableName: "Localization",
                                 bundle: (.main),
                                 value: self,
                                 comment: self)
    }
    
    func localized(_ args: CVarArg...) -> String {
        return String(format: self.localized, arguments: args)
    }
}

