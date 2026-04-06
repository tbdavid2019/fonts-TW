# 888可愛體 - 簡體自動轉繁體

基於 **瀨戶字體/內海字體** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字問題（例如：發→發/髮、後→後/後、幹→乾/幹/幹）。
- **多版本輸出：** 同時提供閱讀用、創作用與多字重 `TC` 版本。

## 檔案說明
- **主要 TTF：** `888cuteFont-Regular_TC.ttf`、`888cuteFont-Light_TC.ttf`、`888cuteFont-ExtraLight_TC.ttf`、`888cuteFont-Bold_TC.ttf`、`888cuteFont--SemiBold_TC.ttf`
- **其他版本：** `888cuteFont--Regular-book-TW.ttf`、`888cuteFont--Regular-write-TW.ttf`、`888cuteFont--Regular-Lite_TC.ttf`
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

.cute-book {
  font-family: '888Cute Book', sans-serif;
}

.cute-write {
  font-family: '888Cute Write', sans-serif;
}
```

## 效果預覽
<img width="773" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/b8883b94-1b25-425e-83a9-0019ac947a7d">

## 感謝與授權
- **源字體：** 瀨戶字體、內海字體
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
