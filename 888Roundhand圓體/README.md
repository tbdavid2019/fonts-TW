# 888Roundhand圓體 - 簡體自動轉繁體

基於 **臺灣圓體 (TaiwanPearl)** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字與詞彙消歧問題（例如：发现／头发 → 發現／頭髮、后来／皇后 → 後來／皇后、业余／多余 → 業餘／多餘）。
- **多字重閱讀：** 提供 `ExtraLight`、`Light`、`Regular`、`Medium`、`SemiBold` 等版本。
- **多用途輸出：** 同時提供電子書用 TTF、`webfont` 用 WOFF2，以及 `Rotated90偽直排` 版本。

## 下載建議
- **電子書/閱讀器：** 請下載 `888Roundhand-Regular_TC.ttf`（或依需求選擇其他字重）。
- **偽直排需求：** 請查看 `Rotated90偽直排/888Roundhand-Regular_TC_Rotated90.ttf`（其餘字重也已提供）。
- **網頁使用：** 請查看 `webfont/` 資料夾中的 `.woff2` 與 `fonts.css`。

## Webfont 快速使用

```html
<link rel="stylesheet" href="./webfont/fonts.css">
```

```css
body {
  font-family: '888Roundhand', sans-serif;
  font-weight: 400;
}
```

## 效果預覽
<img width="533" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/e0dc9591-56c1-4541-b2da-715808933e8a">

## 感謝與授權
- **源字體：** [臺灣圓體](https://github.com/max32002/TaiwanPearl)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
