# fonts-TW Font Production Workflow

這份文件是給新的 LLM 或新的工作環境直接參考用。

工作目錄：

- fonts repo: `/Users/david/Documents/git/tbdavid2019/fonts-TW`
- generator repo: `/Users/david/Documents/git/tbdavid2019/OpenCCFontGenerator`

常見來源字型通常在：

- `/Users/david/Downloads/...`

## 目標

在 `fonts-TW` 製作或更新字型時，通常要完成這些事：

- 用 OpenCCFontGenerator 把來源字轉成 `TC` 或 `s2tw`
- 產出 `TTF`
- 產出 `webfont/WOFF2`
- 產出 `Rotated90偽直排`
- 補 family `README.md`
- 需要時做 release zip 與 GitHub Release

## 建議輸出結構

單一字重通常長這樣：

```text
<family>/
  <FontName>-Regular_TC.ttf
  README.md
  Rotated90偽直排/
    <FontName>-Regular_TC_Rotated90.ttf
  webfont/
    <FontName>-Regular_TC.woff2
    fonts.css
```

多字重家族照同樣規則放多個 weight。

## 1. 先檢查來源字型

先看：

- 有哪些字重
- Unicode 覆蓋量夠不夠
- 是否需要 fallback

常用檢查：

```bash
source "$HOME/.virtualenvs/opencc_gen/bin/activate"
python - <<'PY'
from fontTools.ttLib import TTFont
font=TTFont('/path/to/source.ttf')
cmap={}
for t in font['cmap'].tables:
    if t.isUnicode():
        cmap.update(t.cmap)
print('unicode_cmap', len(cmap))
print('han', sum(1 for cp in cmap if 0x4E00 <= cp <= 0x9FFF))
print('bopomofo', sum(1 for cp in cmap if 0x3100 <= cp <= 0x312F or 0x31A0 <= cp <= 0x31BF))
PY
```

## 2. 執行 OpenCCFontGenerator

不要假設 module 已安裝到 venv。最穩定做法：

```bash
cd /Users/david/Documents/git/tbdavid2019/OpenCCFontGenerator
source "$HOME/.virtualenvs/opencc_gen/bin/activate"
PYTHONPATH=src python -m OpenCCFontGenerator ...
```

典型指令：

```bash
PYTHONPATH=src python -m OpenCCFontGenerator \
  -i '/path/to/source.ttf' \
  -o '/Users/david/Documents/git/tbdavid2019/fonts-TW/<family>/<FontName>-Regular_TC.ttf' \
  --config s2tw \
  --font-name '<FontName>' \
  --fallback-font '/Users/david/Downloads/Noto_Sans_TC/static/NotoSansTC-Regular.ttf' \
  --woff2
```

注意：

- 預設優先用 `--config s2tw`
- 只有使用者明講才加 `--no-punc`
- `--fallback-font` 是補目標缺字，不是萬能補字
- `.woff2` 會先產在 `.ttf` 旁邊，之後要移進 `webfont/`

## 3. 重要限制

OpenCCFontGenerator 目前的 fallback 只補「轉換後的目標字」，不補「來源簡體字」。

意思是：

- 如果來源字型本身沒有某個簡體字，對應的簡轉繁規則就不會觸發
- 所以來源字型若不是完整簡中字庫，`s2tw` / `s2t` 覆蓋率會受限制

這件事要明講給使用者知道。

## 4. 製作 Rotated90偽直排

輸入要用剛生成好的 `_TC.ttf`。

建議做法：

```bash
cd /Users/david/Documents/git/tbdavid2019/OpenCCFontGenerator
source "$HOME/.virtualenvs/opencc_gen/bin/activate"
PYTHONPATH=src python - <<'PY'
from OpenCCFontGenerator.run90 import process_rotation
process_rotation(
    input_path='/Users/david/Documents/git/tbdavid2019/fonts-TW/<family>/<FontName>-Regular_TC.ttf',
    output_path='/Users/david/Documents/git/tbdavid2019/fonts-TW/<family>/Rotated90偽直排/<FontName>-Regular_TC_Rotated90.ttf',
    center_x=500,
    center_y=500,
    rotate_all=False,
    direction='ccw'
)
PY
```

規則：

- `rotate_all=False`
- 英文和數字保持原樣
- 漢字和注音會旋轉
- 檔名尾巴保持 `_Rotated90.ttf`

## 5. 整理 webfont

把生成的 `.woff2` 移進 `webfont/`，再寫 `fonts.css`。

單一字重範例：

```css
@font-face {
  font-family: 'FontName';
  src: url('FontName-Regular_TC.woff2') format('woff2');
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
```

多字重家族：

- 同一家族共用同一個 `font-family`
- 依檔案設定正確 `font-weight`

## 6. 補 README

每個 family 的 `README.md` 要用使用者看得懂的寫法。

至少要寫：

- 這是什麼字型
- 電子閱讀器 / 電子書 App 要下載哪個檔
- `Rotated90偽直排` 要下載哪個檔
- webfont 要用哪個檔
- 一段最簡單的 webfont 引用範例
- 如果原字庫有限制，要直接寫出來

## 7. 新增 family 時要同步

如果新增字型家族：

- 更新 `/Users/david/Documents/git/tbdavid2019/fonts-TW/README.md`

如果 webfont family 名稱或用法變了：

- family README 的範例要同步更新

## 8. release 打包

release zip 是本地產物，放：

- `release/<tag>/`

不要 commit。

目前命名規則：

- `<Family>-ebook-<tag>.zip`
- `<Family>-rotated90-<tag>.zip`
- `<Family>-webfont-<tag>.zip`

## 9. 發 GitHub Release

這個 repo 已有腳本：

```bash
cd /Users/david/Documents/git/tbdavid2019/fonts-TW
./scripts/release.sh 2026-04-06
```

它會：

- 讀 `release/<tag>/*.zip`
- 如果 release 不存在就建立
- 如果已存在就覆蓋上傳同名 zip
- 預設寫使用者看得懂的 release notes

可選：

```bash
./scripts/release.sh 2026-04-06 --title "fonts-TW 2026-04-06"
./scripts/release.sh 2026-04-06 --notes-file /tmp/release-notes.md
```

## 10. repo hygiene

- 不要 commit `release/`
- 不要 commit `.DS_Store`
- 小心 repo 內原本就存在的雜項變更，例如 `LICENSE`、`LICENSE.txt`、根目錄 `OFL.txt`
- 只 commit 這次字型任務真的相關的檔案

## 實例：888Bopomofo注音

來源：

- `/Users/david/Downloads/BpmfIansui/BpmfIansui-Regular.ttf`

輸出：

- `888Bopomofo注音/888Bopomofo-Regular_TC.ttf`
- `888Bopomofo注音/Rotated90偽直排/888Bopomofo-Regular_TC_Rotated90.ttf`
- `888Bopomofo注音/webfont/888Bopomofo-Regular_TC.woff2`
- `888Bopomofo注音/webfont/fonts.css`

對應指令：

```bash
cd /Users/david/Documents/git/tbdavid2019/OpenCCFontGenerator
source "$HOME/.virtualenvs/opencc_gen/bin/activate"
PYTHONPATH=src python -m OpenCCFontGenerator \
  -i '/Users/david/Downloads/BpmfIansui/BpmfIansui-Regular.ttf' \
  -o '/Users/david/Documents/git/tbdavid2019/fonts-TW/888Bopomofo注音/888Bopomofo-Regular_TC.ttf' \
  --config s2tw \
  --font-name '888Bopomofo' \
  --fallback-font '/Users/david/Downloads/Noto_Sans_TC/static/NotoSansTC-Regular.ttf' \
  --woff2
```

之後再：

- 從 `_TC.ttf` 生成 `Rotated90`
- 把 `.woff2` 移進 `webfont/`
- 補 `README.md` 與 `fonts.css`
