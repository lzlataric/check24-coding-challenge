//
//  String+Ext.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

extension String {
    func removingNewlines() -> String {
        return self.replacingOccurrences(of: "\n", with: "")
    }
}
