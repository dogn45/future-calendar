import SwiftUI
import WidgetKit

struct MonthEntry: TimelineEntry { let date: Date }
struct MonthProvider: TimelineProvider {
    func placeholder(in context: Context) -> MonthEntry { MonthEntry(date: Date()) }
    func getSnapshot(in context: Context, completion: @escaping (MonthEntry) -> Void) { completion(MonthEntry(date: Date())) }
    func getTimeline(in context: Context, completion: @escaping (Timeline<MonthEntry>) -> Void) {
        let now = Date()
        let tomorrow = Calendar.current.nextDate(after: now, matching: DateComponents(hour: 0, minute: 0), matchingPolicy: .nextTime) ?? now.addingTimeInterval(86400)
        completion(Timeline(entries: [MonthEntry(date: now)], policy: .after(tomorrow)))
    }
}
struct MonthWidgetView: View {
    let entry: MonthEntry
    private let calendar = Calendar(identifier: .gregorian)
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 7)
    private let names = ["일", "월", "화", "수", "목", "금", "토"]
    private var dates: [Int?] {
        guard let interval = calendar.dateInterval(of: .month, for: entry.date),
              let days = calendar.range(of: .day, in: .month, for: entry.date) else { return [] }
        let offset = calendar.component(.weekday, from: interval.start) - 1
        return Array(repeating: nil, count: offset) + days.map { Optional($0) }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(entry.date.formatted(.dateTime.year().month(.wide))).font(.headline.bold())
                Spacer()
                Text("FUTURE").font(.caption.bold()).foregroundStyle(.secondary)
            }
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(0..<7, id: \.self) { i in
                    Text(names[i]).font(.caption2.bold()).foregroundStyle(.secondary).frame(maxWidth: .infinity)
                }
                ForEach(Array(dates.enumerated()), id: \.offset) { _, day in
                    if let day {
                        Text("\(day)").font(.caption).frame(maxWidth: .infinity, minHeight: 28)
                            .background(day == calendar.component(.day, from: entry.date) ? Color.blue.opacity(0.25) : Color.clear, in: RoundedRectangle(cornerRadius: 7))
                    } else { Color.clear.frame(height: 28) }
                }
            }
            Spacer(minLength: 0)
            Text("큰 달력 위젯 설치 확인용").font(.caption2).foregroundStyle(.secondary)
        }.padding(10).containerBackground(.fill.tertiary, for: .widget)
    }
}
@main struct FutureCalendarWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "FutureCalendarMonth", provider: MonthProvider()) { MonthWidgetView(entry: $0) }
            .configurationDisplayName("Future Calendar")
            .description("이번 달 달력")
            .supportedFamilies([.systemLarge])
    }
}
