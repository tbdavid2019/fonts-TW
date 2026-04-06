# 888Bopomofo 注音

基於 `BpmfIansui-Regular.ttf` 轉換而成的台灣正體版本。

用途

- 電子閱讀器或電子書 App：請使用 `888Bopomofo-Regular_TC.ttf`
- 偽直排閱讀：請使用 `Rotated90偽直排/888Bopomofo-Regular_TC_Rotated90.ttf`
- 網頁嵌入：請使用 `webfont/888Bopomofo-Regular_TC.woff2` 與 `webfont/fonts.css`

注意

- 這份字型是用 OpenCC `s2tw` 生成的台灣正體版本。
- 原始字體本身缺少部分簡體來源字，因此簡轉繁覆蓋率會受原字庫限制。

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
