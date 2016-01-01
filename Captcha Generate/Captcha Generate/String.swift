//
//  String.swift
//  Captcha Generate
//
//  Created by Duc Nguyen on 1/1/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import Foundation

extension String {

	subscript (i: Int) -> Character {
		return self[self.startIndex.advancedBy(i)]
	}

	subscript (i: Int) -> String {
		return String(self[i] as Character)
	}

	subscript (r: Range<Int>) -> String {
		return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
	}
}