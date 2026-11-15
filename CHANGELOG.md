# CHANGELOG

All notable changes to `fonts-TW` (`888` series OpenCC fonts) will be documented here.

---

## [2026-11-15]

### Changed

#### 全面以 OpenCC `1.4.2`（`--config s2tw`）與修復版 GSUB 管線重製 5 組 888 系列字型
使用 `OpenCCFontGenerator` 最新版（修復重複 GSUB feature tag、異體字隔離、`OpenCC 1.4.2` 詞庫與大型字型自動 subset 保護）重新產出 5 組字族的 **主字型 TTF**、**`Rotated90偽直排` TTF**、**`webfont` WOFF2** 與 **`fonts.css`**，確保「后来→後來」「皇后→皇后」「业余→業餘」「发现／头发→發現／頭髮」「面／面条→面／麵條」全數正確且不超翻（`软件→軟件`）：

- **888Bopomofo注音**（1 字重，`font_name: 888Bopomofo`，`63,213` glyphs）：
  - 以 `[orgin]/BpmfIansui/BpmfIansui-Regular.ttf` 搭配 `NotoSansTC-Regular.ttf` 作為 `--fallback-font` 補齊 `1,472` 個 OpenCC 轉換目標字形，同時保留原始注音 GSUB lookup，修復舊版 5 項詞彙轉換全數失效的問題。
- **888zen禪體**（5 字重：`ExtraLight / Light / Regular / SemiBold / Bold`，`font_name: 888Zen`，`51,549` glyphs）：
  - 以 `[orgin]/kurewa-gothic-1.071/CJK TC/` 各字重搭配對應字重 `NotoSansTC-*.ttf` 補齊 `1,977` 個 OpenCC 目標字形，修復舊版「业余／发现／头发」缺字未轉與 Mac `name` table 亂碼問題。
- **888Roundhand圓體**（5 字重：`ExtraLight / Light / Regular / Medium / SemiBold`，`font_name: 888Roundhand`，`53,458` glyphs）：
  - 由 `[orgin]/TaiwanPearl-2.125 2/ttf/` 重製並修復 Mac `name` table 亂碼與對齊 `OpenCC 1.4.2` 詞庫。
- **888LXGW文楷**（6 支：比例寬 `Light / Regular / Medium` (`888LXGW`) 與等寬 `MonoTC-Light / Regular / Medium` (`888LXGW Mono`)，`53,837–53,851` glyphs）：
  - 由 `[orgin]/lxgw-wenkai-v1.530-rc/` 重製對齊 `OpenCC 1.4.2` 詞庫。
- **888cute可愛體**（5 字重：`ExtraLight / Light / Regular / SemiBold / Bold`，`font_name: 888Cute`，`53,538` glyphs）：
  - 由 `[orgin]/naikaifont-1.89/tw/` 重製，統一檔名為 `888cuteFont-<Weight>_TC.{ttf,woff2}` 並清除不一致舊檔，修正 `webfont/fonts.css` 引用與 Mac `name` table 亂碼。
- **文件同步更新**：
  - 建立本檔 `CHANGELOG.md`，並更新根目錄 `README.md` 及上述 5 組字族各自的 `README.md`（修正範例錯字與對應檔名／來源說明）。
- **驗證**：全部 22 支主字型 TTF、22 支 `Rotated90` TTF 與 22 支 `.woff2` 皆檢查 glyph 總數 `<= 65,535`、GSUB 無重複 feature tag、`fonts.css` 與實體檔案一對一吻合，並以 macOS CoreText 實測 44 支 TTF（主版 + 偽直排版）全部通過詞彙與不超翻驗證。
