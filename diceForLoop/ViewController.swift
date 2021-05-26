//
//  ViewController.swift
//  diceForLoop
//
//  Created by 羅承志 on 2021/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: [UILabel]!
    @IBOutlet var pointLabel: [UILabel]!
    @IBOutlet var diceAImageView: [UIImageView]!
    @IBOutlet var diceBImageView: [UIImageView]!
    @IBOutlet var winImageView: [UIImageView]!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    
    var diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var playerAPoint = 0
    var playerBPoint = 0
    var playerAScore = 0
    var playerBScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //使骰子依序排列，上排1-3,下排4-6
        for i in 0...2 {
            diceAImageView[i].image = UIImage(named: String(diceImages[i]))
            diceBImageView[i].image = UIImage(named: String(diceImages[i+3]))
        }
    }

    @IBAction func playDice(_ sender: UIButton) {
        //每次按下Btn，骰子點數歸零
        playerAPoint = 0
        playerBPoint = 0
        //i迴圈 = 3, 設圖片點數(亂數), 亂數出圖[array從零開始因此需-1], 總共三張圖因此總和為三圖的數字相加
        for i in diceAImageView {
            let dicePoint = Int.random(in: 1...6)
            i.image = UIImage(named: diceImages[dicePoint-1])
            playerAPoint = playerAPoint + dicePoint
        }
        for i in diceBImageView {
            let dicePoint = Int.random(in: 1...6)
            i.image = UIImage(named: diceImages[dicePoint-1])
            playerBPoint = playerBPoint + dicePoint
        }
        pointLabel[0].text = "\(playerAPoint)"
        pointLabel[1].text = "\(playerBPoint)"
        //判斷骰子點數輸贏
        if playerAPoint > playerBPoint {
            playerAScore += 1
        } else if playerAPoint < playerBPoint {
            playerBScore += 1
        }
        scoreLabel[0].text = "\(playerAScore)"
        scoreLabel[1].text = "\(playerBScore)"
        //先達五分win
        if playerAScore == 5 {
            rollButton.isHidden = true
            winImageView[0].image = UIImage(named: "win")
        } else if playerBScore == 5 {
            rollButton.isHidden = true
            winImageView[1].image = UIImage(named: "win")
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        playerAScore = 0
        playerBScore = 0
        playerAPoint = 0
        playerBPoint = 0
        scoreLabel[0].text = "\(playerAScore)"
        scoreLabel[1].text = "\(playerBScore)"
        pointLabel[0].text = "\(playerAPoint)"
        pointLabel[1].text = "\(playerBPoint)"
        rollButton.isHidden = false
        //設[win圖片].image為空白
        for i in winImageView {
            i.image = UIImage(named: "")
        }
    }
}

