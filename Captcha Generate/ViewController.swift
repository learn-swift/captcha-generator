//
//  ViewController.swift
//  Captcha Generate
//
//  Created by Duc Nguyen on 1/1/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit
enum MESSAGE {
	case MATCH
	case NOT_MATCH
}
class ViewController: UIViewController {
	
	@IBOutlet weak var labelCaptcha: UILabel!
	@IBOutlet weak var textfieldEnterCaptcha: UITextField!
	@IBOutlet weak var labelMessage: UILabel!
	@IBOutlet weak var buttonReload: UIButton!
	@IBOutlet weak var buttonSubmit: UIButton!
	@IBOutlet weak var captchaView: UIView!
	
	let arr: String = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#!%*"
	
	var currentCaptcha = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.reloadCaptcha()
		textfieldEnterCaptcha.becomeFirstResponder()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func reloadCaptcha() {
		currentCaptcha = getRandomCaptcha()
		labelCaptcha.text = currentCaptcha
		captchaView.backgroundColor = getRandomColor()
		textfieldEnterCaptcha.text = ""
	}
	func getRandomCaptcha() -> String {
		var captcha = ""
		let count = UInt32(arr.characters.count)
		
		let index1 = Int(arc4random_uniform(count))
		let index2 = Int(arc4random_uniform(count))
		let index3 = Int(arc4random_uniform(count))
		let index4 = Int(arc4random_uniform(count))
		let index5 = Int(arc4random_uniform(count))
		
		captcha = String(format: "%@%@%@%@%@", arguments: [arr[index1], arr[index2], arr[index3], arr[index4], arr[index5]])
		print("\(index1)-\(index2)-\(index3)-\(index4)-\(index5)-\(captcha)")
		return captcha
	}
	func getRandomColor() -> UIColor {
		let hue : CGFloat = (CGFloat(arc4random() % 256) / 256.0) // 0.0 to 1.0
		let saturation : CGFloat = (CGFloat(arc4random() % 128) / 256.0) + 0.5 // 0.5 to 1.0, away from white
		let brightness : CGFloat = (CGFloat(arc4random() % 128) / 256.0) + 0.5 // 0.5 to 1.0, away from black
		let color: UIColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
		return color
	}
	
	@IBAction func actionReloadCaptcha(sender: UIButton) {
		reloadCaptcha()
		labelMessage.text = ""
	}
	
	@IBAction func actionSubmit(sender: UIButton) {
		switch checkIsMatchTwoString() {
		case .MATCH:
			labelMessage.text = "Success"
			labelMessage.textColor = UIColor.greenColor()
			break
		case .NOT_MATCH:
			labelMessage.text = "Failed"
			labelMessage.textColor = UIColor.redColor()
			break
		}
		
		
	}
	
	func checkIsMatchTwoString() -> MESSAGE {
		let input = textfieldEnterCaptcha.text
		if input == currentCaptcha {
			return MESSAGE.MATCH
		} else {
			return MESSAGE.NOT_MATCH
		}
	}
}

