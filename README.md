# RubyPyMill 💎⇄📓

**Running Notebooks the Ruby Way — RubyPyMill and the Art of PoC Automation**

---

## 🧭 背景と目的

RubyPyMill は、Ruby から **Papermill（Python Notebook Runner）** を制御して、
「PoC（概念実証）で生まれた知見を業務システムに標準化する」ための
軽量ランナー/自動化スターターです。

PoC は終わりではなく、経験値を統合する開始点。
Ruby の表現力と Python の実行力を結び、「人間が知識を使いこなす様にコードを使いこなす」開発サイクルを実現します。

---

## 💡 設計思想 — Ruby 4.0 @30 に対する機械語的アプローチ

RubyPyMill は **Ruby 4.0 の理念「多言語協調」** を体現するプラクティスです。
Ruby が DSL（制御と記述）を担い、Python が Notebook（実行と計算）を担う。
この二つの世界を自然に渡ることで、コンテキストの内部でも Notebook の再現性を Ruby 側で利用できるようにします。

> 💬 「Ruby は機械ではなく人のために設計された (designed for humans, not machines)」
> — Yukihiro “Matz” Matsumoto

---

## 🧹 構成概要

```
RubyPyMill/
├── bin/                      # CLI: ruby_pymill 実行エントリ
├── lib/                      # RubyPyMill ライブラリ本体
├── py/                       # Python 側 (Papermill 実行環境)
├── examples/
│   ├── notebooks/            # Notebook サンプル
│   ├── params/               # パラメータ JSON
│   ├── outputs/              # 出力結果
│   └── commands/             # 実行コマンド例 (.pwsh)
├── .github/workflows/        # CI（Ruby + Python テスト）
├── .vscode/                  # VS Code 設定（tasks/debug推奨）
└── Gemfile / .ruby-version / .gitignore
```

---

## ⚙️ セットアップ

```bash
# Ruby 側
bundle install

# Python 側（仮想環境作成 + 依存導入）
python3 -m venv .venv && source .venv/bin/activate
pip install -r py/requirements.txt

# Python カーネル登録（Papermill 実行用）
python -m ipykernel install --user --name python3
```

---

## 🚀 サンプル実行

PowerShell 版（`examples/commands/sample_tag_command.pwsh`）:

```powershell
bundle exec ruby -I lib bin\ruby_pymill exec examples\notebooks\sample.ipynb `
  --output examples\outputs\out_ruby.ipynb `
  --kernel rpymill `
  --cell-tag run_only `
  --params ".\examples\params\demo.json"
```

結果：

```text
Hello, Ruby-PaperMill! #1
Hello, Ruby-PaperMill! #2
...
Hello, Ruby-PaperMill! #10
```

> parameters タグ付きセルは Papermill が特別扱いで自動注入します。
> `--cell-tag run_only` 指定時でも実行され、for文セルで利用可能です。

---

## 🧱 セル構成例

| # | 内容                    | タグ           | 役割                         |
| - | --------------------- | ------------ | -------------------------- |
| 1 | 変数初期化                 | *(なし)*       | ローカルデバッグ用（Papermill実行時は不要） |
| 2 | パラメータ代入 (`n`, `name`) | `parameters` | JSONから自動注入                 |
| 3 | for文（処理）              | `run_only`   | 実際の実行対象                    |

---

## 🧰 PowerShell 実行スクリプト（共通化例）

`examples/commands/run_notebook.pwsh`:

```pwsh
pwsh examples/commands/run_notebook.pwsh             # タグ実行
pwsh examples/commands/run_notebook.pwsh -Full       # 全セル実行
pwsh examples/commands/run_notebook.pwsh -Params .\examples\params\demo.json
```

---

## 🪄 今後の展開

| 開発トピック             | 概要                         |
| ------------------ | -------------------------- |
| Rake連携             | 一括Notebook実行とレポート生成        |
| Result API         | Notebook出力をRubyオブジェクトとして取得 |
| Local RAG連携        | LLMによるPoC結果の再利用            |
| CI/CD統合            | 自動検証・再現性テストの仕組み化           |
| Notebook → System化 | PoCを業務処理に転用するパイプライン        |

---

## 📘 ライセンス

MIT License
© 2025 Hiroshi Inoue / OSS-Vision

---

## 🪞 補記

RubyPyMill は OSS-Vision と Ruby コミュニティの協働実験として開発されています。
この仕組みが、地方の技術チームや PoC 実務の現場における
「試行と業務の橋渡し」 の一助となることを願っています。

---

### 🔧 提案メモ

* `.github/workflows/ci.yml` に **自動 Notebook 実行ジョブ** を追加すると、
  “ドキュメントから PoC が実行される” ワークフローが完成します。
* README のサブタイトル（💎🔁📓）は GitHub 上での視認性が高いため、このまま維持推奨です。
