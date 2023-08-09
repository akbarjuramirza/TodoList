//
//  AddView.swift
//  TodoList
//
//  Created by Akbarjon Juramirzaev on 08/08/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView { // start of ScrollView
            VStack { // start of VStack
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.9333333333333333, green: 0.9294117647058824, blue: 0.9294117647058824, alpha: 1.0)))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            } // end of VStack
            .padding(14)
        } // end of ScrollView
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    } // end of body
    
    // Function to save todo from textfield
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    // Function to check whether textFieldText is appropriate
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! ⚠️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    // Function to show Alert
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
