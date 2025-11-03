# RubyPyMill

Ruby から **Papermill**（Python notebooks）を安全に実行・パラメタ渡し・成果物収集するための最小スターターです。  
VS Code 用の設定、Ruby CLI、Rake タスク、CI、Python 連携テンプレも同梱。

## ざっくり構成

```
.vscode/               VS Code 設定（推奨拡張、lint/format、tasks、debug）
.github/workflows/     CI（RubyとPythonのlint/test）
bin/                   CLI（`ruby_pymill`）
lib/                   ライブラリ本体
py/                    Python 側（papermill 実行環境）
examples/              サンプル（notebook/params）
```

## セットアップ

```bash
# Ruby
bundle install

# Python（pyenv/venv等は任意）
python3 -m venv .venv && source .venv/bin/activate
pip install -r py/requirements.txt
python -m ipykernel install --user --name rpymill

# 動作確認（dry-run）
bundle exec ruby_pymill run examples/notebooks/sample.ipynb   --output examples/outputs/out.ipynb   --params examples/params/demo.json --dry-run
```

## 使い方（CLI）

```bash
ruby_pymill run <input_ipynb> --output <output_ipynb>   [--kernel rpymill] [--params params.json] [--cwd path] [--dry-run]
```

## ライセンス

MIT