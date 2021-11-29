//
//  ViewController.swift
//  personal_play
//
//  Created by 036 on 2021/11/15.
//  Copyright © 2021 lkj. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        
    }

    @IBOutlet weak var cubenumis: UILabel!
    @IBOutlet weak var levelis: UILabel!
    @IBOutlet weak var scoreis: UILabel!
    @IBOutlet weak var ques: UILabel!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    var rightcnt = 0
    var trycnt = 0
    @IBAction func clnum1(_ sender: Any) {
        num1.setTitle(String(random_num[1]), for: .normal)
        if(random_num[1] == ques_num)
        {
            rightcnt+=1
        }
     
        trycnt+=1
        calu()
    }
    @IBAction func inc(_ sender: Any) {
        level -= 1
        if(level < 1)
        {
            level = 1
        }
        levelis.text = "难度:\(6-level)"
    }
    
    @IBAction func dec(_ sender: Any) {
        level += 1
        if(level > 5)
        {
            level = 5
        }
        levelis.text = "难度:\(6-level)"
    }
    @IBAction func inc1(_ sender: Any) {
        cnum += 3
        if(cnum >= 9)
        {
            cnum = 9
        }
        cubenumis.text = "块数:\(cnum)"
    }
    @IBAction func dec2(_ sender: Any) {
        cnum -= 3
        if(cnum <= 3)
        {
            cnum = 3
        }
        cubenumis.text = "块数:\(cnum)"
    }
    @IBAction func clnum2(_ sender: Any) {
        num2.setTitle(String(random_num[2]), for: .normal)
        if(random_num[2] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    
    @IBAction func clnum3(_ sender: Any) {
        num3.setTitle(String(random_num[3]), for: .normal)
        if(random_num[3] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum4(_ sender: Any) {
        num4.setTitle(String(random_num[4]), for: .normal)
        if(random_num[4] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum5(_ sender: Any) {
        num5.setTitle(String(random_num[5]), for: .normal)
        if(random_num[5] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum6(_ sender: Any) {
        num6.setTitle(String(random_num[6]), for: .normal)
        if(random_num[6] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum7(_ sender: Any) {
        num7.setTitle(String(random_num[7]), for: .normal)
        if(random_num[7] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum8(_ sender: Any) {
        num8.setTitle(String(random_num[8]), for: .normal)
        if(random_num[8] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    @IBAction func clnum9(_ sender: Any) {
        num9.setTitle(String(random_num[9]), for: .normal)
        if(random_num[9] == ques_num)
        {
            rightcnt+=1
        }
        trycnt+=1
        calu()
    }
    var legal_num :[Int] = [0,1,2,3,4,5,6,7,8,9]
    var random_num = [Int](repeating: 0, count: 10)
    var ques_num = 0
    var cnum = 9
    var level = 5
    var totcnt = 0;
    @IBAction func startGame(_ sender: Any) {
        clear()
        ques.text = "..."
        rightcnt = 0
        totcnt = 0
        trycnt = 0
        for i in 1..<random_num.count{
               random_num[i] = Int(arc4random() % 10)
           }
        if(cnum == 3)
        {
            ques_num = random_num[Int(arc4random() % 3) + 1]
        }
        else if(cnum == 6)
        {
            ques_num = random_num[Int(arc4random() % 6) + 1]
        }else
        {
            ques_num = random_num[Int(arc4random() % 9) + 1]
        }
       
        for i in 1..<random_num.count{
            if(random_num[i] == ques_num)
            {
                totcnt += 1;
            }
        }
        
        scoreis.text = "当前得分：...%    完成率：...%"
       
       
        
        self.num1.setTitle(String(self.random_num[1]), for: .normal)
        self.num2.setTitle(String(self.random_num[2]), for: .normal)
        self.num3.setTitle(String(self.random_num[3]), for: .normal)
        if(cnum > 3)
        {
            self.num4.setTitle(String(self.random_num[4]), for: .normal)
            self.num5.setTitle(String(self.random_num[5]), for: .normal)
            self.num6.setTitle(String(self.random_num[6]), for: .normal)
            if(cnum > 6)
            {
                self.num7.setTitle(String(self.random_num[7]), for: .normal)
                self.num8.setTitle(String(self.random_num[8]), for: .normal)
                self.num9.setTitle(String(self.random_num[9]), for: .normal)
            }
        }
       
        
            
        let queue = DispatchQueue.global(qos: .default)
        queue.async {
            /*Thread.sleep(forTimeInterval: Double(self.level))
            DispatchQueue.main.async {
                 self.clear()
                
            }*/
            var tmp = self.level-1
            while(tmp >= -1)
            {
                Thread.sleep(forTimeInterval: 1)
                DispatchQueue.main.sync {
                    if(tmp == 0)
                    {
                        self.ques.text = "go"
                    }
                    else{
                        self.ques.text = "   " + String(tmp)
                    }
                   
                }
                tmp -= 1
    
            }
            DispatchQueue.main.async {
                 self.clear()
            }
        }
    }
    func clear()
    {
        self.ques.text = "   " + String(self.ques_num)
        num1.setTitle("", for: .normal)
        num2.setTitle("", for: .normal)
        num3.setTitle("", for: .normal)
        num4.setTitle("", for: .normal)
        num5.setTitle("", for: .normal)
        num6.setTitle("", for: .normal)
        num7.setTitle("", for: .normal)
        num8.setTitle("", for: .normal)
        num9.setTitle("", for: .normal)
    }
    func calu()
    {
        var gg : Double
        var per : Double
        if(trycnt != 0)
        {
            gg = Double(rightcnt)/Double(trycnt)
        }
        else {
            gg = 0
        }
        var score = Int(gg * 100)
        /*if(totcnt != 0)
        {*/
            per = Double(rightcnt)/Double(totcnt)
       /* }
        else
        {
            per = 0
        }*/
        var per1 = Int(per * 100)
        scoreis.text = "当前得分：\(score)%    完成率：\(per1)%"
    }
}

