## Lazy Load Images in TableView
- Use URLSession to download images asynchronously
- Cache downloaded images into a dictionary
  - Use singleton to cache images
- Update cell image only when the `captured indexPath` equals the `current indexPath`
  - because the indexPath at cell creation and cell loading could be different (e.g. scroll down before image is downloaded)

## 테이블뷰 이미지 지연 로딩
- URLSession으로 이미지 비동기 다운로드
- 딕셔너리에 다운받은 이미지 캐싱
  - 싱글턴을 활용해 이미지 저장
- 캡처된 indexPath랑 현재 indexPath가 같아야만 이미지뷰 업데이트
  - cell을 생성할 때의 indexPath와 로드될 때의 indexPath가 다를 수 있기 때문 (이미지가 다운되기 전에 아래로 스크롤해버린 경우)
