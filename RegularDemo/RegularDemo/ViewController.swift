//
//  ViewController.swift
//  RegularDemo
//
//  Created by 也许、 on 16/11/14.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qqText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func checkQQ(_ sender: Any) {
        
        do {
            
            let qqStr = self.qqText.text!
            
            // 正则表达式
            let pattern = "[1-9][0-9]{4,14}"
            
            // 正则对象
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            
            // 返回符合规则的第一个匹配结果
            let result = regex.firstMatch(in: qqStr, options: .init(rawValue: 0), range: NSMakeRange(0, qqStr.characters.count))
            
            // 返回符合规则的匹配结果数组
//            let result2 = regex.matches(in: qqStr, options: .init(rawValue: 0), range: NSMakeRange(0, qqStr.characters.count))
            
            // 返回符合规则的匹配结果个数
//            let result3 = regex.numberOfMatches(in: qqStr, options: .init(rawValue: 0), range: NSMakeRange(0, qqStr.characters.count))
            
            guard let r = result else {
                self.resultLabel.text = "不符合QQ号码规则"
                return
            }
            
            let range = r.range
            if range.location == 0 {
                self.resultLabel.text = "符合QQ号码规则"
            } else {
                self.resultLabel.text = "不符合QQ号码规则"
            }
            
        } catch {
            print(error)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

