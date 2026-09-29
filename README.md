# Future Calendar 큰 위젯 설치 실험

Windows + iPhone + 무료 Apple 계정에서 **큰 홈 화면 위젯 설치가 가능한지** 먼저 시험하는 최소 프로젝트입니다
현재 위젯은 이번 달 날짜만 표시하며 일정 저장과 새 소식 기능은 없습니다

1. 이 폴더 전체를 GitHub 저장소에 올립니다 공개 저장소의 표준 GitHub Actions는 무료입니다
2. Actions에서 `Build iPhone widget trial`을 수동 실행하고 artifact ZIP을 받아 압축을 풀면 `.ipa`가 나옵니다
3. Windows용 [AltStore Classic](https://altstore.io/)을 공식 안내에 따라 설치하고, iPhone에서 이 IPA를 설치합니다 Apple ID 암호는 GitHub나 이 프로젝트에 입력하지 마세요
4. 아이폰 홈 화면을 길게 눌러 `위젯 추가` → `Future Calendar` → 큰 위젯을 확인합니다

이 경로는 아직 실제 iPhone에서 검증되지 않았습니다 GitHub 빌드나 AltStore 설치가 실패하면 오류 화면을 보내주세요 무료 계정 앱은 7일마다 갱신해야 합니다
