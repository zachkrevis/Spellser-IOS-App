//
//  LionSpellManager.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/5/22.
//

import Foundation
import UIKit
import SwiftUI

class SpellsterManager : ObservableObject {

    @Published var guessedWord = ""
    @Published var enableSubmit = false
    @Published var correctWords : Array<String> = []
    @Published var score = 0
    @Published var possibleWords : Array<String> = []
    @Published var possibleScore = 0
    @Published var possiblePangrams = 0
    @Published var keyboardLetters : Array<Character> = []
    
    init() {
        keyboardLetters = getKeyboardValues()
        possibleWords = getAllPossibleWords()
        possibleScore = getAllPossiblePoints()
        possiblePangrams = getAllPangrams()
        
    }
    
    func getKeyboardValues() -> Array<Character> {
        var eligibleCombos : Array<String> = []
        var keyboard : Array<Character> = []
        
        eligibleCombos = Words.keyboardWords
        
        let randomInt = Int.random(in: 0...eligibleCombos.count-1)
        
        let Chosen = eligibleCombos[randomInt].uppercased()
        
        keyboard = Array(Chosen.uppercased())
        
        keyboard.shuffle()
        
        return keyboard
    }
    
    func keyboardType(typedChar: String) {
        guessedWord.append(typedChar)
        
        if (getWords().contains(guessedWord.lowercased()) && !correctWords.contains(guessedWord) && guessedWord.count >= 4) {
            enableSubmit = true
        } else {
            enableSubmit = false
        }
    }
    
    func delChar() {
        guessedWord = String(guessedWord.dropLast())
        
        if (getWords().contains(guessedWord.lowercased()) && !correctWords.contains(guessedWord) && guessedWord.count >= 4) {
            enableSubmit = true
        } else {
            enableSubmit = false
        }
    }
    
    func checkString() {
        
        if (getWords().contains(guessedWord.lowercased()) && !correctWords.contains(guessedWord)) {
            
            if (guessedWord.count==4) {
                score += 1
            } else if (guessedWord.count > 4) {
                score += guessedWord.count
            }
            
            if (Set(guessedWord).count == 7) {
                score += 5
            }
            
            enableSubmit = false
            correctWords.insert(guessedWord, at: 0)
            guessedWord = ""
            
        }
        else {
            enableSubmit = false
            guessedWord = ""
        }
    }
    
    func isAllUnique(string: String) -> Bool {
        
        let array = Set(string)
        
        if (array.count == string.count) {
            return true
        }
        
        return false
    }
    
    func getWords() -> Array<String>{
        return Words.words
    }
    
    func getAllPossibleWords() -> Array<String>{
        
        var returnString : Array<String> = []
        
        for word in getWords() {
            if (Set(word.uppercased()).isSubset(of: keyboardLetters)) {
                returnString.append(word)
            }
        }
        return returnString
    }
    
    func getAllPossiblePoints() -> Int {
        
        var returnScore : Int = 0
        
        for word in possibleWords {
            if (word.count==4) {
                returnScore += 1
            } else if (word.count > 4) {
                returnScore += word.count
            }
            
            if (Set(word).count == 7) {
                returnScore += 5
            }
        }
        return returnScore
    }
    
    func getAllPangrams() -> Int {
        var returnInt : Int = 0
        
        for word in possibleWords {
            if (Set(word).count == 7) {
                returnInt += 1
            }
        }
        
        return returnInt
    }
    
    func newGame() -> Void {
        guessedWord = ""
        correctWords = []
        score = 0
        enableSubmit = false
        keyboardLetters = getKeyboardValues()
        possibleWords = getAllPossibleWords()
        possibleScore = getAllPossiblePoints()
        possiblePangrams = getAllPangrams()
    }

    
}
