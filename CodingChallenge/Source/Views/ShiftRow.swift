import SwiftUI

struct ShiftRow: View {
    
    let shift: Shift
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(shift.localizedSpecialty.name)
            
            HStack {
                Text(shift.normalizedStartDate)
                Text("-")
                Text(shift.normalizedEndDate)
            }
            .font(.caption)
        }
    }
}

struct ShiftRow_Previews: PreviewProvider {
    static var previews: some View {
        ShiftRow(shift: .mock)
    }
}
