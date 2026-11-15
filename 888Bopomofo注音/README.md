# 888Bopomofo 注音

基於 `BpmfIansui-Regular.ttf` 轉換而成的台灣正體版本。

用途

- 電子閱讀器或電子書 App：請使用 `888Bopomofo-Regular_TC.ttf`
- 偽直排閱讀：請使用 `Rotated90偽直排/888Bopomofo-Regular_TC_Rotated90.ttf`
- 網頁嵌入：請使用 `webfont/888Bopomofo-Regular_TC.woff2` 與 `webfont/fonts.css`

注意

- 這份字型是使用 OpenCC `1.4.2`（`s2tw`）生成的台灣正體版本，並搭配 `NotoSansTC-Regular` 作為 `--fallback-font` 補齊 OpenCC 轉換目標字形，同時保留原始注音 GSUB 破音字規則與 OpenCC 詞級轉換。
- 原始 `BpmfIansui` 漢字數約 8,364 字，部分未收錄於 `NotoSansTC` 目標補字範圍內的罕見字仍會受原字庫限制。

Webfont 用法

```html
<link rel="stylesheet" href="./webfont/fonts.css">
```

```css
body {
  font-family: '888Bopomofo', sans-serif;
  font-weight: 400;
}
```
