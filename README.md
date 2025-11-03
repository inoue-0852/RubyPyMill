# RubyPyMill 💎🔁📓
**Running Notebooks the Ruby Way — RubyPyMill and the Art of PoC Automation**

---

## 🧭 背景と目的

RubyPyMill は、Ruby から **Papermill（Python Notebook Runner）** を制御して、  
「PoC（概念実証）で生まれた知見を業務システムに橋渡しする」ための  
軽量ランナー／自動化スターターです。

PoC は終わりではなく、組織的な知識循環のはじまり。  
Ruby の表現力と Python の実行力をつなぎ、  
“Ruby らしいかたちでデータと協働する” 開発サイクルを目指します。

---

## 💡 設計思想 — Ruby 4.0 @30 に寄せて

RubyPyMill は、**Ruby4.0 の理念「多言語協調」** に沿って設計されています。  
Ruby が DSL（制御・記述）を担い、Python が Notebook（実行・計算）を担う。  
その橋渡しを自動的に行うことで、  
Ruby の世界から Notebook の再現性をそのまま利用できる環境を実現します。

> 💬 “Ruby は、人と人、そしてツールとツールの協調を目指す。”  
> — Yukihiro “Matz” Matsumoto

---

## 🧩 概念図

+----------------+ +-------------------+ +----------------+
| Ruby / CLI / | ---> | Papermill Runner | ---> | Jupyter Notebook |
| Rake / CI/CD | | (via Python3) | | (PoC実行環境) |
+----------------+ +-------------------+ +----------------+
↑ ↓
|----------------- データ・成果物共有 ----------------|


---

## 📁 構成概要
.vscode/ VS Code 設定（推奨拡張、lint/format、tasks、debug）
.github/workflows/ CI（RubyとPythonのlint/test）
bin/ CLI（ruby_pymill 実行スクリプト）
lib/ RubyPyMillライブラリ本体
py/ Python側（Papermill 実行環境）
examples/ サンプル（notebook/params/output）


---

## ⚙️ セットアップ

```bash
# Ruby
bundle install

# Python（仮想環境の作成と依存パッケージ導入）
python3 -m venv .venv && source .venv/bin/activate
pip install -r py/requirements.txt

# Python カーネル登録（Papermill 実行用）
python -m ipykernel install --user --name python3


## 動作確認（Dry Run）

bundle exec ruby bin/ruby_pymill \
  exec examples/notebooks/sample.ipynb \
  --output examples/outputs/out.ipynb \
  --params examples/params/demo.json \
  --kernel python3 \
  --dry-run

  ## 使い方（CLI）

  ruby_pymill run <input_ipynb> \
  --output <output_ipynb> \
  [--kernel python3] \
  [--params params.json] \
  [--cwd path] \
  [--dry-run]

##今後の展開

開発トピック	概要
Rake連携	一括ノートブック実行・レポート生成
Result API	Notebook出力をRubyオブジェクトとして取得
Local RAG連携	LLMによるPoC結果の再利用
CI/CD統合	自動検証・再現性テストの仕組み化
Notebook → System化	PoCを業務処理に転用できるパイプライン化

## 📘 ライセンス

MIT License
© 2025 Hiroshi Inoue / OSS-Vision

## 🪞 補記

RubyPyMill は OSS-Vision と Ruby コミュニティの協調実験として開発されています。
この仕組みが、地方の技術チームや PoC 実務の現場における
「試行と業務の橋渡し」の一助となることを願っています。


---

### 🔧 提案メモ
- `.github/workflows/ci.yml` にこの README を反映した **自動 Notebook 実行ジョブ** を加えると、  
  “ドキュメントから PoC が実行される” 世界が完成します。  
- README 上部のサブタイトル（💎🔁📓）は GitHub 表示時に映えるので残しておきましょう。

## 
