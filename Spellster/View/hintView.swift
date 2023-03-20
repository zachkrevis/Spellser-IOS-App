//
//  SwiftUIView.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/13/22.
//

import SwiftUI

struct hintView: View {
    
    let possibleWords : Array<String>
    let possiblePoints : Int
    let possiblePangrams : Int
    @State private var isExpanded = false

    
    func wordsOfLength(length : Int) -> [String : Int] {
        var charDict : [String : Int] = [:]
        
        for word in possibleWords {
            if word.count == length {
                charDict[String(Array(word)[0]), default: 0] += 1
            }
        }
        
        return charDict
    }
    
    func maxChar(array: [String]) -> Int {
        var maxWord = 0
        
        if let max = possibleWords.max(by: {$1.count > $0.count}) {
            maxWord = max.count
        }
        
        return maxWord
    }

    
    var body: some View {
        ZStack {
            VStack {
                
                List {
                    Section(header: Text("Summary")){
                        Text("Possible Words: \(possibleWords.count)")
                        Text("Possible Points: \(possiblePoints)")
                        Text("Possible Pangrams: \(possiblePangrams)")
                    }
                    
                    
                    ForEach(4...maxChar(array: possibleWords), id: \.self) { charCount in
                        
                        let charDict : [String : Int] = wordsOfLength(length: charCount)
                        
                        if charDict.count != 0 {
                            Section(header: Text("Words of Length \(charCount)")){
                            
                                ForEach(0..<Array(charDict.keys).count, id: \.self) { i in
                                    Text("\(Array(charDict.keys)[i]): \(Array(charDict.values)[i])")
                            
                                }
                            
                            }
                        }
                    }
                    
                    
                    
                    
                }
                
                Spacer()
            }
        }.ignoresSafeArea().preferredColorScheme(.dark).padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        hintView(possibleWords: ["Apple", "Banana", "Cockroach", "Diamond"],possiblePoints: 0, possiblePangrams: 0)
    }
}
