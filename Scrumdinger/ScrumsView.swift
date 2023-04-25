//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by bMatheron on 08/04/2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrum = false
    @State private var newScrumData = DailyScrum.Data()
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewScrum = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrum) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrum = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrum = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if scenePhase == .inactive {
                saveAction()
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static let scrums = DailyScrum.sampleData
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: { })
        }
    }
}
