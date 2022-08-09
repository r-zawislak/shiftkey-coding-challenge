import SwiftUI

struct ShiftDetailsView: View {
    
    let shift: Shift
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                row(label: "Start", value: shift.normalizedStartDate)
                row(label: "End", value: shift.normalizedEndDate)
                row(label: "Specialty name", value: shift.localizedSpecialty.name)
                row(label: "Timezone", value: shift.timezone)
                row(label: "Premium rate", value: shift.premiumRate)
                row(label: "Covid", value: shift.covid)
                row(label: "Facility type", value: shift.facilityType.name)
                row(label: "Distance", value: "\(shift.withinDistance)")
                row(label: "Skill", value: shift.skill.name)
            }
            .navigationTitle("Shift details")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func row(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
        }
    }
    
    private func row(label: String, value: Bool) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value ? "Yes" : "No")
        }
    }
}

struct ShiftDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetailsView(shift: .mock)
    }
}
