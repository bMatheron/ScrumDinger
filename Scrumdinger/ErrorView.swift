//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by bMatheron on 11/04/2023.
//

import SwiftUI

struct ErrorView: View {
    let error: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)
                Text(error.error.localizedDescription)
                    .font(.headline)
                Text(error.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum sampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: sampleError.errorRequired, guidance: "You can safely ignore this error.")
    }
    static var previews: some View {
        ErrorView(error: wrapper)
    }
}
