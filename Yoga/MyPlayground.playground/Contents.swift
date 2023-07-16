import UIKit

extension Array where Element: Hashable {
    
    
    /// 相同元素
    var duplicates : [Element] {
        var keys:[Element:()] = [:]
        var array = filter{keys.updateValue((), forKey:$0) != nil}
        return array.deduplicates
    }
    /// 去重
    var deduplicates: [Element] {
        var keys:[Element:()] = [:]
        return filter{keys.updateValue((), forKey:$0) == nil}
    }
    
    /// 有重复元素
    var haveDuplicates:Bool {
        return duplicates.count > 0
    }

}

extension String {
  
    // 切割两个一组
    func splitRule()->[String] {
        
        var array = self.map({ "\($0)" })
        var resultArray: [String] = []

        while (array.count > 0) {
            var first = array[0]
            if array.count >= 2 {
                first += array[1]
            }
            resultArray.append(first)
            
            array.removeFirst()
        }
        return resultArray
    }
    ///  分割成指定长度数组
    func splitRule(lenght: Int)->[String] {
        var target = self // copy
        
        var resultArray: [String] = []
        while (target.count > 0) {
            if target.count > lenght {
                let idx = target.index(target.startIndex, offsetBy: lenght)
                resultArray.append("\(target[target.startIndex..<idx])")
                target.removeFirst() // 移除一位
            }else {
                resultArray.append(target)
                target = ""  //
            }
        }
        return resultArray
    }
    
    
    var rule4:Bool {
        return rule5 && (self.chartSort(than: 3) == false)
    }
    
    // 组合多于 2 个
    var rule5: Bool {
        return self.splitRule(lenght: 2).duplicates.count <= 0
    }
    /// 不包含多于4个
    var rule6: Bool {
        return self.keybordSortMore(than: 4) == false
    }
    /// 单个元素 占大于等于一半
    var rule7:Bool {
        let result = Dictionary(grouping: self.map({ $0 }), by: \.description)
        let haft = CGFloat(self.count) / 2
        return result.first(where: { CGFloat($0.value.count) >= haft  }) == nil
    }
    
    
    
    /// 键盘顺序 匹配
    func keybordSortMore(than:Int) -> Bool {
        let target = "qwertyuiopasdfghjklzxcvbnm"
        let revTarget = String(target.reversed()) // 倒序
        
        let targetArray = target.splitRule(lenght: than)
        let revArray = revTarget.splitRule(lenght: than)
        
        let selfArray = self.splitRule(lenght: than)
        
        let result = Set(targetArray).intersection(Set(selfArray))
        let revResult = Set(revArray).intersection(Set(selfArray))
        
        return (result.count > 0) || (revResult.count > 0)
    }
    
    /// 顺序字符串匹配
    func chartSort(than:Int) -> Bool {
        let target = "abcdefghijklmnopqrstuvwxyz0123456789"
        let revTarget = String(target.reversed())  // 倒序
        
        let targetArray = target.splitRule(lenght: than)
        let revArray = revTarget.splitRule(lenght: than)
        
        let selfArray = self.splitRule(lenght: than)
        
        let result = Set(targetArray).intersection(Set(selfArray))
        let revResult = Set(revArray).intersection(Set(selfArray))
        
        return (result.count > 0) || (revResult.count > 0)
    }

}


var greeting = "Hello, playground"

var rule1 = "beahk3608"
var rule2 = "beakk3688"

var rule3 = "aaa36081";
var rule4 = "beahk111";
var rule5 = "abc36081";
var rule6 = "beahk123";
var rule7 = "beahk363636"
var rule8 = "beahkhk36hk"


let ok = ["beahk3608","beakk3688","0000000002wse"]
let error = ["aaa36081", "beahk111","abc36081","beahk123","beahk363636","beahkhk36hk","abcde"]

let pr = { (text: String)-> Void in
    let array = text.splitRule(lenght: 2)
    print(" \(text) : 有重复\(array.haveDuplicates)")
    print(array)
    print(array.deduplicates)
    print(array.duplicates)
}

let sort = {(text: String) in
    print(text)
    print("有键盘顺序/倒序 \(text.keybordSortMore(than: 4))")
    print("有字母顺序/倒序 \(text.chartSort(than: 3))\n")
}

let pwd = {(text: String) in
    print(text)
    print("rule4 - \(text.rule4)")
    print("rule5 - \(text.rule5)")
    print("rule6 - \(text.rule6)")
    print("rule7 - \(text.rule7)")
}


//ok.forEach { pr($0) }
//error.forEach { pr($0) }
//
//
//sort("qwe")
//sort("trewq")
//sort("edcg")
//
//sort("abcd")
//sort("dcba")
//
//sort("123")
//sort("321")
//sort("sdfdsfx")

pwd("abc36081")
pwd("beahk363636")
pwd("beahk3608")
pwd("3633ea33h3k")
pwd("aabcd")
