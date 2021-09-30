//
//  gamePlay.swift
//  quiz
//
//  Created by 楊昕蕾 on 2021/9/29.
//

import UIKit

class gamePlay: UIViewController {
    
    var Questions = [question]()
    
    var index = 0
    
    var score = 0
    
    var correctAnswer = ""

    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var numberLbl: UILabel!
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet var answer: [UIButton]!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        Questions.append(question(description: "蝙蝠", answer: "こうもり", option: ["ぺんふく", "へんぷう", "こうもり", "もうふり"]))
        Questions.append(question(description: "啄木鳥", answer: "きつつき", option: ["きつつき", "たくぼくちょう", "たっきちょう", "つきき"]))
        Questions.append(question(description: "硯", answer: "すずり", option: ["けん", "すずみ", "すずり", "しじみ"]))
        Questions.append(question(description: "鱸", answer: "すずき", option: ["ろう", "ろ", "るうお", "すずき"]))
        Questions.append(question(description: "蒲公英", answer: "たんぽぽ", option: ["ぽこうえい", "たんぽぽ", "ぷこうえい", "ぽうたんぽ"]))
        Questions.append(question(description: "万年青", answer: "おもと", option: ["まんねんせい", "まんねんあお", "おもと", "しじみ"]))
        Questions.append(question(description: "青竜蝦", answer: "しゃこ", option: ["しゃこ", "せいりゅうえび", "あおりゅうえび", "いせえび"]))
        Questions.append(question(description: "悖る", answer: "もとる", option: ["ぼつる", "もとる", "ぼくる", "もどる"]))
        Questions.append(question(description: "諫める", answer: "いさめる", option: ["いさめる", "ねめる", "けんめる", "れめる"]))
        Questions.append(question(description: "凩", answer: "こがらし", option: ["き", "おろし", "きふう", "こがらし"]))
        Questions.append(question(description: "五月雨", answer: "さみだれ", option: ["さみだれ", "ごがつあめ", "さつきあめ", "さつきう"]))
        Questions.append(question(description: "金剛石", answer: "ダイヤモンド", option: ["こんごういし", "きんこんいし", "きんこうしき", "ダイヤモンド"]))
        Questions.append(question(description: "青玉", answer: "サファイア", option: ["サファイア", "あおぎょく", "サファリ", "せいぎょうく"]))
        Questions.append(question(description: "鯵", answer: "あじ", option: ["あし", "さん", "あじ", "しょう"]))
        Questions.append(question(description: "壁蝨", answer: "だに", option: ["しらたに", "だに", "たり", "かべだに"]))
        Questions.append(question(description: "無花果", answer: "いちじく", option: ["ぶかか", "むはなか", "いちじく", "いちかぐ"]))
        
        
        
        //題目洗牌
        Questions.shuffle()
        gamePlay()
        
        
    }
    
        func gamePlay(){

            //選項洗牌
            Questions[index].option.shuffle()
            //顯示題目
            questionLbl.text = Questions[index].description
            //存入正確答案
            correctAnswer = Questions[index].answer
            //設置選項
            for i in 0...3{
                answer[i].setTitle(Questions[index].option[i], for: .normal)
        }
            numberLbl.text = "第\(index+1)問"

    }
    
    @IBAction func clickAnswer(_ sender: UIButton) {
        index += 1
        progressBar.progress += 0.1
        
        /* 檢查用
        print(index)
        print(progressBar.progress)
        */
        
        if sender.currentTitle == correctAnswer{
            score += 10
            scoreLbl.text = String(score)
        }

        if index < 10{
            gamePlay()
        }
        else{
            gameOver()
        }
   
    }
    
    @IBAction func restart(_ sender: Any) {
        index = 0
        score = 0
        scoreLbl.text = String(score)
        progressBar.progress = 0.1
        Questions.shuffle()
        gamePlay()
    }
    

    func alertMessage(switchTitle: String, switchMessage: String){
        
        let alert = UIAlertController(
            title: switchTitle,
            message: switchMessage,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "もう一度挑戦する",
                                     style: .default,
                                     handler: (restart(_:)))

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func gameOver(){
        
        if score >= 80{
            alertMessage(switchTitle: "score:\(score)", switchMessage: "まさに漢字の神です！")
        }
        else if score < 80 && score > 60{
            alertMessage(switchTitle: "score:\(score)", switchMessage: "漢字の修練は、まだ終わりませんね！")
        }
        else{
            alertMessage(switchTitle: "score:\(score)", switchMessage: "国語の授業は、ちゃんと受けていましたか？")
        }
    }
    
}
