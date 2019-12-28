//
//  ViewController.swift
//  XOGame
//
//  Created by Mahmoud El-Melligy on 10/13/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //score label
    @IBOutlet weak var playerTurnLable: UILabel!
    @IBOutlet weak var playAgainButtonOutLet: UIButton!
    
    //declaration
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameState = [0,0,0,0,0,0,0,0,0]
    var playerTurn = 1
    var winner = false
    var count = 0
    var playerOneWin = 0
    var playerTwoWin = 0
    let myCustomColor = UIColor(red: 72/255.0, green: 191/255.0, blue: 191/255.0, alpha: 1.0) // sRGB
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        playAgainButtonOutLet.isHidden = true
        playerTurnLable.text = "X turn"

    }
    @IBAction func xOrOButtonPressed(_ sender: AnyObject) {
        //check if it's pressed befor or not & if any one won
        if gameState[sender.tag-1] == 0 && winner == false{
            if playerTurn == 1{
                sender.setImage(UIImage(named: "X"), for: .normal)
                playerTurn = 2
                playerTurnLable.text = "O turn"
                count += 1
                gameState[sender.tag-1] = 1
                print(count)
            }else{
                sender.setImage(UIImage(named: "O"), for: .normal)
                playerTurn = 1
                playerTurnLable.text = "X turn"
                count += 1
                gameState[sender.tag-1] = 2
            }
        }
        //check if some one win or not
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 &&
               gameState[combination[0]] == gameState[combination[1]] &&
               gameState[combination[1]] == gameState[combination[2]] {
               winner = true
                playAgainButtonOutLet.isHidden = false
                if gameState[combination[0]] == 1{
                    print("x has won")
                    playerTurnLable.textColor = myCustomColor
                    playerTurnLable.text = "X Wins"
                }else if gameState[combination[0]] == 2{
                    playerTurnLable.textColor = myCustomColor
                    playerTurnLable.text = "O Wins"
                    print("o has won")
                }
            }
        }
        //check if draw
        if count == 9{
            print("draw")
            winner = true
            playAgainButtonOutLet.isHidden = false
            count = 0
            playerTurnLable.text = "Draw"
            
        }

    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        //rest the game
        gameState = [0,0,0,0,0,0,0,0,0]
        playerTurn = 1
        winner = false
        playAgainButtonOutLet.isHidden = true
        count = 0
        playerTurnLable.text = "X turn"
        for index in 1...9{
            let button = view.viewWithTag(index) as! UIButton
            button.setImage(nil, for: .normal)
        }
    
    }

    
}

