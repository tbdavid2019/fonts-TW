# 888禪體 - 簡體自動轉繁體

基於 **苦累蛙圓體 (Kurewa Gothic) / 紅道字體 (Zen Kurenaido)** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字與詞彙消歧問題（例如：发现／头发 → 發現／頭髮、后来／皇后 → 後來／皇后、业余／多余 → 業餘／多餘）。
- **缺字補全：** 使用對應字重的 `Noto Sans TC` 補齊 OpenCC 轉換目標所需的缺字，並維持原本手寫風主字形。
- **手寫風格：** 保留苦累蛙圓體 / Zen Kurenaido 的手寫感，適合標題與輕閱讀。

## 下載建議
- **電子書/閱讀器：** 請下載 `888zen-Regular_TC.ttf` (或 Light/Bold 等版本)。
- **偽直排需求：** 請查看 `Rotated90偽直排/` 資料夾。
- **網頁使用：** 請查看 `webfont/` 資料夾中的 `.woff2` 與 `fonts.css`。

## Webfont 快速使用

```html
<link rel="stylesheet" href="./webfont/fonts.css">
```

```css
body {
  font-family: '888Zen', sans-serif;
  font-weight: 400;
}
```

## 效果預覽
<img width="858" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/43130441-75e9-4f53-bbe3-a53c61e44570">

## 感謝與授權
- **源字體：** [苦累蛙圓體](https://github.com/max32002/kurewa-gothic)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
