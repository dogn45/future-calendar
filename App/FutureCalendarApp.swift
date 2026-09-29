import SwiftUI

@main
struct FutureCalendarApp: App {
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 16) {
                Text("Future Calendar").font(.largeTitle.bold())
                Text("홈 화면에 큰 달력 위젯을 추가해 주세요")
                Text("이 버전은 위젯 설치 확인용입니다")
                    .foregroundStyle(.secondary)
            }.padding()
        }
    }
}
