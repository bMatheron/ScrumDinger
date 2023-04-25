//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by bMatheron on 10/04/2023.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondRemaining: Int
    let secondElapsed: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    var body: some View {
        VStack {
        ProgressView(value: progress)
//                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondRemaining: 20, secondElapsed: 60, theme: DailyScrum.sampleData[0].theme)
            .previewLayout(.sizeThatFits)
    }
}
