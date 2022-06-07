# bk_Archlinux
ArchLinuxのためのdotfilesプロジェクト

dotfiles目的で作成したけど肥大しすぎた。


# バックアップ取得

```
make backup
```
現在入っているパッケージリストを取得します。
# 必須パッケージインストール

```
make default
```
必須パッケージのインストール

# パッケージインストール

```
make appinstall
```
アプリのインストール

# dotfilesインストール
```
make dotfiles
```
dotfiles群を設置する

# docker
```
make docker
```
当プロジェクトのテスト用にdockerコンテナを用意
