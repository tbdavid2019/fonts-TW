# 繁體字型專案 README 優化與 Git 推送實作計畫

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 統一專案內所有字型資料夾的 README 格式與檔名，補全文楷字型說明，更新根目錄索引，最後將變更推送到遠端倉庫。

**Architecture:** 採用標準化模板更新各子目錄 README，確保訊息一致且易於閱讀。

**Tech Stack:** Markdown, Git

---

### Task 1: 檔名標準化與子目錄 README 更新

**Files:**
- Modify: `888circle圓體/Readme.md` -> `888circle圓體/README.md`
- Modify: `888cute可愛體/readme.md` -> `888cute可愛體/README.md`
- Modify: `888zen禪體(手寫體)/readme.md` -> `888zen禪體(手寫體)/README.md`
- Create: `888LXGW文楷/README.md`

- [ ] **Step 1: 重新命名現有 README 文件**

執行：
```bash
mv 888circle圓體/Readme.md 888circle圓體/README.md
mv 888cute可愛體/readme.md 888cute可愛體/README.md
mv "888zen禪體(手寫體)/readme.md" "888zen禪體(手寫體)/README.md"
```

- [ ] **Step 2: 更新 888circle圓體/README.md**

```markdown
# 888圓體 - 簡體自動轉繁體

基於 **臺灣圓體 (TaiwanPearl)** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字問題（例如：發→發/髮、後→後/後、幹→乾/幹/幹）。
- **閱讀與創作：** 提供 book (閱讀用) 與 write (創作用) 兩種版本。

## 下載建議
- **電子書/閱讀器：** 請下載 `circle888-book.ttf`。
- **偽直排需求：** 請查看 `Rotated90偽直排/circle888-book_Rotated90.ttf`。
- **創作用：** 請下載 `circle888-write.ttf` (不轉換歧異字)。

## 效果預覽
<img width="533" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/e0dc9591-56c1-4541-b2da-715808933e8a">

## 感謝與授權
- **源字體：** [臺灣圓體](https://github.com/ButTaiwan/TaiwanPearl)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
```

- [ ] **Step 3: 更新 888cute可愛體/README.md**

```markdown
# 888可愛體 - 簡體自動轉繁體

基於 **瀨戶字體/內海字體** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字問題（例如：發→發/髮、後→後/後、幹→乾/幹/幹）。

## 下載建議
- **電子書/閱讀器：** 請下載 `cute888-Regular-book-TW.ttf`。
- **創作用：** 請下載 `cute888-Regular-write-TW.ttf` (不轉換歧異字)。

## 效果預覽
<img width="773" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/b8883b94-1b25-425e-83a9-0019ac947a7d">

## 感謝與授權
- **源字體：** 瀨戶字體、內海字體
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
```

- [ ] **Step 4: 更新 888zen禪體(手寫體)/README.md**

```markdown
# 888禪體 - 簡體自動轉繁體

基於 **苦累蛙圓體 (Kurewa Gothic) / 紅道字體 (Zen Kurenaido)** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字問題（例如：發→發/髮、後→後/後、幹→乾/幹/幹）。

## 下載建議
- **電子書/閱讀器：** 請下載 `888zen-Regular_TC.ttf` (或 Light/Bold 等版本)。
- **創作用：** 請下載 `888zen-write-TW` (若有的話)。

## 效果預覽
<img width="858" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/43130441-75e9-4f53-bbe3-a53c61e44570">

## 感謝與授權
- **源字體：** [苦累蛙圓體](https://github.com/ButTaiwan/kurewa-gothic)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
```

- [ ] **Step 5: 建立 888LXGW文楷/README.md**

```markdown
# 888文楷 - 簡體自動轉繁體

基於 **霞鶩文楷 (LXGW WenKai)** 修改，讓編輯器或閱讀器自動將簡體中文顯示為繁體。

## 核心特點
- **簡對多繁不麻煩：** 解決常見歧異字問題（例如：發→發/髮、後→後/後、幹→乾/幹/幹）。
- **閱讀體驗：** 文楷字體端正清晰，非常適合電子書閱讀。

## 下載建議
- **電子書/閱讀器：** 請下載 `888LXGW-Regular_TC.ttf` (或 Light/Medium 版本)。
- **偽直排需求：** 請查看 `Rotated90偽直排` 資料夾。

## 效果預覽
![alt text](../image.png)

## 感謝與授權
- **源字體：** [霞鶩文楷](https://github.com/lxgw/LxgwWenKai)
- **授權：** 基於 SIL Open Font License 1.1 授權條款免費公開。
```

---

### Task 2: 根目錄 README 更新

**Files:**
- Modify: `README.md`

- [ ] **Step 1: 重整根目錄 README 內容**

```markdown
# 888 系列繁體字型 (簡體自動顯示為繁體)

只要下載並安裝這些字型，在編輯器或閱讀器中選擇使用，所有的簡體中文將自動顯示為繁體。無需額外設定，連 Windows 記事本也適用。

## 快速導覽
- [**888圓體**](./888circle圓體/README.md) - 基於臺灣圓體，適合一般閱讀。
- [**888禪體**](./888zen禪體(手寫體)/README.md) - 基於苦累蛙圓體，具備手寫風格。
- [**888可愛體**](./888cute可愛體/README.md) - 基於瀨戶/內海字體，風格活潑。
- [**888文楷**](./888LXGW文楷/README.md) - 基於霞鶩文楷，極致的閱讀體驗。

## 使用場景
- **電子書閱讀：** 電子閱讀器專用字體，解決一對多繁體轉換問題。
- **瀏覽器顯示：** 讓網頁簡體字自動變繁體。
- **創作開發：** 提供不轉換歧異字的版本，方便精確選字。

## 下載位置
👉 [GitHub Releases 下載點](https://github.com/tbdavid2019/fonts-TW/releases)

---

## 效果展示
### 888文楷
![alt text](image.png)

### 888圓體
<img width="676" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/09a9a825-8773-4c34-818a-63d61e231945">

### 888禪體 (手寫體)
<img width="858" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/43130441-75e9-4f53-bbe3-a53c61e44570">

### 888可愛體
<img width="858" alt="image" src="https://github.com/tbdavid2019/fonts-TW/assets/56015064/0b558123-b6f9-406b-9785-aceeed8a1bcb">

--
#### 製作工具與教學
- **888 字型生成工具 (最新)** 採用自動化生成精靈： [OpenCCFontGenerator](https://github.com/tbdavid2019/OpenCCFontGenerator)
- 偽直排製作教學： [Tony's Note](https://tonysnote.whybut.com/2023/07/fontforge.html)
```

---

### Task 3: Git 提交與推送

- [ ] **Step 1: 檢查狀態並暫存所有變更**

執行：
```bash
git status
git add .
```

- [ ] **Step 2: 建立提交**

執行：
```bash
git commit -m "docs: 統一 README 格式並新增文楷字型說明"
```

- [ ] **Step 3: 推送到遠端**

執行：
```bash
git push
```
