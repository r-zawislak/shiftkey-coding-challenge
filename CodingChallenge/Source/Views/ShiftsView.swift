//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    
    @StateObject var viewModel = ShiftsViewModel()
    @State private var isSheetPresented = false
    @State private var selectedShift: Shift?
    
    var body: some View {
        NavigationView {
            list
                .navigationTitle("Shifts")
                .task {
                    viewModel.fetchData()
                }
        }
        .navigationViewStyle(.stack)
    }
    
    private var list: some View {
        List {
            ForEach(viewModel.dayShifts, id: \.dateString) { dayShifts in
                Section(dayShifts.dateString) {
                    ForEach(dayShifts.shifts) { shift in
                        ShiftRow(shift: shift)
                            .onTapGesture {
                                selectedShift = shift
                            }
                            .onAppear {
                                viewModel.fetchDataIfNeeded(dayShifts: dayShifts)
                            }
                    }
                }
            }
        }
        .sheet(item: $selectedShift) { shift in
            ShiftDetailsView(shift: shift)
        }
    }       
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
