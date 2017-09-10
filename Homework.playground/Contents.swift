//: Playground - noun: a place where people can play

import UIKit

// HW 1
var original = "Hello world"
var remove = "o"

func trim (originalString: String, stringToRemove: String) -> String{
    var result = ""
    
    let originalCharArray = Array(originalString.characters)
    let removingStringArray = Array(stringToRemove.characters)
    
    var t = ""
    
    var i = 0, j = 0
    while i < originalCharArray.count {
        if originalCharArray [i] == removingStringArray [j] {
            if j == removingStringArray.count - 1 {
                
                t = ""
                j = 0
            }
            else {
                t.append(originalCharArray[i])
                j += 1
            }
        } else {
            result.append(t)
            t = ""
            
            if j == 0 {
                
                result.append(originalCharArray[i])
            } else {
                j = 0
                i -= 1
            }
        }
        i+=1
    }
    return result
}
trim(originalString : original, stringToRemove: remove)





//HW 2
class Unit {
    var health = 100
    var damage = 10
    var protection = 10
    var agility = 10
    var nickname = ""
    func atack(to enemy: Unit) {
        enemy.health = enemy.health - damage
    }
    
}
class Mage: Unit {
    override init() {
        super.init()
        health = 80
        damage = 20
        agility = 5
        nickname = "Mage"
    }
    override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/4)
        print("Mage used some Magic")
    }
}
class Knight: Unit {
    override init() {
        super.init()
        health = 120
        protection = 30
        agility = 3
        nickname = "Knight"
    }
    override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/4)
        print("Knight attacked")
    }
}
class Assassin: Unit {
    override init() {
        super.init()
        damage = 15
        protection = 15
        nickname = "Assassin"
    }
    override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/4)
        print("Assassin attacked")
    }
}
class BattleField {
    func beginBattle(player1 : Unit, player2: Unit) {
        while (player1.health > 0) || (player2.health > 0) {
            player1.atack(to: player2)
            print(player2.health)
            if (player2.health<=0 ){
                print(player1.nickname + " wins!")
                break
            }
            player2.atack(to: player1)
            print(player1.health)
            if player1.health<=0 {
                print(player2.nickname + " wins!")
                break
            }
        }
    }
}
let player1 = Assassin()
let player2 = Knight()
var battle = BattleField()
battle.beginBattle(player1: player1, player2: player2)
print("Players who played today: " + player1.nickname + ", " + player2.nickname + "!!")





