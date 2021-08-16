## Lazy Load Images in TableView
- Use URLSession to download images asynchronously
- Cache downloaded images using NSCache
  - Use Singleton to store cache
- NSCache is preferable to Dictionary
  - NSCache automatically removes the least recently used objects when running low on memory
  - NSCache is thread-safe
- Update cell image only when the `captured indexPath` equals the `current indexPath`
  - because the indexPath at cell creation and cell loading could be different

## 테이블뷰 이미지 지연 로딩
- URLSession으로 이미지 비동기 다운로드
- NSCache에 다운받은 이미지 캐싱
  - 싱글턴을 활용해 이미지 저장
- Dictionary 대신 NSCache 사용
  - NSCache는 메모리가 부족할 때 가장 오래전에 사용된 객체를 제거해서 메모리를 관리
  - NSCache는 thread-safe
- 캡처된 indexPath랑 현재 indexPath가 같아야만 이미지뷰 업데이트
  - cell을 생성할 때의 indexPath와 이미지를 로드할 때의 indexPath가 다를 수 있기 때문
