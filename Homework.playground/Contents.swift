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
    var health: Int = 100
    var damage: Int
    var protection: Int
    var agility:Int
    var nickname = ""
    func atack(to enemy: Unit) {
        enemy.health = enemy.health - damage
    }
    init(health: Int, damage: Int,protection: Int, agility: Int, nickname: String) {
        self.agility = agility
        self.damage = damage
        self.health = health
        self.nickname = nickname
        self.protection = protection
    }
}
let balance = 4
class Mage: Unit {
    override init(health: Int, damage: Int, protection: Int, agility: Int, nickname: String) {
        super.init(health: health, damage: damage, protection: protection, agility: agility, nickname: nickname)
    }
        override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/balance)
        print("Mage used some Magic")
    }
}
class Knight: Unit {
    override init(health: Int, damage: Int, protection: Int, agility: Int, nickname: String) {
        super.init(health: health, damage: damage, protection: protection, agility: agility, nickname: nickname)
    }
    override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/balance)
        print("Knight attacked")
    }
}
class Assassin: Unit {
    override init(health: Int, damage: Int, protection: Int, agility: Int, nickname: String) {
        super.init(health: health, damage: damage, protection: protection, agility: agility, nickname: nickname)
    }
    override func atack(to enemy: Unit) {
        enemy.health = enemy.health - (damage - enemy.protection/balance)
        print("Assassin attacked")
    }
}
class BattleField {
    func beginBattle(with units: Unit...) {
        print("The battle begins!" + "\n" + "!-----Let's go-----!")
        
        while units[0].health > 0 && units[1].health > 0 && units[2].health > 0 {
            units[0].atack(to: units[1])
            units[1].atack(to: units[2])
            units[2].atack(to: units[0])
        }
        print("The battle ended" + "\n" )
        print("People who took part in battle: " + units[0].nickname + ", " + units[1].nickname + ", " + units[2].nickname)
        if units[0].health>0 {
            print(units[0].nickname + " wins")
        } else { if units[1].health>0 && units[2].health<=0 {
            print(units[1].nickname + " wins")
        } else{
            print(units[2].nickname + " wins")
            }
        }
    }
}

var firstPlayer = Assassin(health: 100, damage: 45, protection: 10, agility: 15, nickname: "Yea boi")
var secondPlayer = Knight(health: 120, damage: 20, protection: 20, agility: 3, nickname: "Retro paladin")
var thirdPlayer = Mage(health: 90, damage: 50, protection: 5, agility: 10, nickname: "Mage")
var battleField = BattleField()
battleField.beginBattle(with: firstPlayer,secondPlayer,thirdPlayer)


