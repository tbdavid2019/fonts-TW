# 888可愛體 - 簡體自動轉繁體

基於 **內海字體 (NaikaiFont 1.89 TW / 瀨戶字體衍生)** 修改，採用 OpenCC `1.4.2` (`s2tw`) 規則，讓編輯器或閱讀器自動將簡體中文顯示為台灣正體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字與詞彙消歧問題（例如：发现／头发 → 發現／頭髮、后来／皇后 → 後來／皇后、业余／多余 → 業餘／多餘）。
- **多字重輸出：** 提供 `ExtraLight`、`Light`、`Regular`、`SemiBold`、`Bold` 等 `TC` 版本（含橫排、偽直排與 Webfont）。

## 檔案說明
- **主要 TTF：** `888cuteFont-ExtraLight_TC.ttf`、`888cuteFont-Light_TC.ttf`、`888cuteFont-Regular_TC.ttf`、`888cuteFont-SemiBold_TC.ttf`、`888cuteFont-Bold_TC.ttf`
- **偽直排版本：** 請查看 `Rotated90偽直排/` 資料夾。
- **網頁版本：** 請查看 `webfont/` 資料夾中的 `.woff2` 與 `fonts.css`。

## Webfont 快速使用

```html
<link rel="stylesheet" href="./webfont/fonts.css">
```

```css
body {
  font-family: '888Cute', sans-serif;
  font-weight: 400;
}
```

## 效果預覽
<img width="773" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/b8883b94-1b25-425e-83a9-0019ac947a7d">

## 感謝與授權
- **源字體：** 瀨戶字體、[內海字體](https://github.com/max32002/naikaifont)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
