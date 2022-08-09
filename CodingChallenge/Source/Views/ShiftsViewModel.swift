import Combine
import CombineMoya
import Moya
import Foundation

final class ShiftsViewModel: ObservableObject {
    
    @Published var dayShifts: [DayShifts] = []
    @Published var isLoading = false
    
    private let provider = MoyaProvider<ShiftKeyApi>()
    private var cancellables = Set<AnyCancellable>()
    private var startDate: Date = .now
    
    func fetchData() {
        let dayTimeInterval: TimeInterval = 60 * 60 * 24
        let endDate = startDate.addingTimeInterval(dayTimeInterval)

        isLoading = true
        
        provider.requestPublisher(.getAvailableShifts(address: "Dallas, TX", type: .list, start: startDate, end: endDate))
            .map(AvailableShiftsResponse.self)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.startDate = endDate
                    self?.isLoading = false
                    
                    guard case let .failure(error) = completion else { return }
                    
                    print(error)
                }, receiveValue: { [weak self] response in
                    guard let strongSelf = self else {
                        return
                    }
                    
                    var allDayShifts = strongSelf.dayShifts
                    
                    let uniqueDayShifts = response.data.filter {
                        !allDayShifts.contains($0)
                    }
                    
                    allDayShifts.append(contentsOf: uniqueDayShifts)
                    strongSelf.dayShifts = allDayShifts.sorted(by: >)
                }
            )
            .store(in: &cancellables)
    }
    
    func fetchDataIfNeeded(dayShifts: DayShifts) {
        guard
            dayShifts.dateString == self.dayShifts.last?.dateString,
            isLoading == false
        else {
            return
        }
        
        fetchData()
    }
}
