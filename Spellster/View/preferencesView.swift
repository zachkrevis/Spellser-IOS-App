//
//  preferencesView.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/13/22.
//

import SwiftUI

struct preferencesView: View {
    @Binding var preferences : Preferences
    @Environment (\.dismiss) private var dismiss
    
    let dismissAction : () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Section(header: Text("Language").foregroundColor(Color.white)) {
                    Picker("Languages", selection: $preferences.language){
                        ForEach(Language.allCases) {
                            Text($0.rawValue.capitalized).tag($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Section(header: Text("Number of Keys").foregroundColor(Color.white).padding(.top)) {
                    Picker("keyNumbers", selection: $preferences.keyNumber){
                        ForEach(KeyNumber.allCases) {
                            Text(String($0.rawValue)).tag($0)
                        }
                    }.pickerStyle(.segmented)
                }
                Spacer()
                
                Button("Dismiss") {
                    dismissAction()
                    dismiss()
                }
            }
        }.ignoresSafeArea().preferredColorScheme(.dark).padding()
    }
}

struct preferencesView_Previews: PreviewProvider {
    static var previews: some View {
        preferencesView(preferences: .constant(Preferences()), dismissAction: {})
    }
}
