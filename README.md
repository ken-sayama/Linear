# Linear

直感的にカスタマイズ出来るようなイメージで作ったので、Linearという名称にしました。

### 目次

1. Linearの概要
2. 依存しているライブラリ
3. 使用手順

## 1. Linearの概要

Linearは[Riot](http://riotjs.com/)をベースに構築しました。
Riotはカスタムタグを用いて、関連するHTML、CSS、Javascriptをひとまとめにコンポーネントとしてまとめて管理してしまおうという設計思想があります。

Reactを使うまでもないけど、コンポーネントとしてまとめたいという時に非常に効果的だと感じました。また数多あるJavascriptのフレームワークやライブラリのように学習コストがしんどいということもなく、とてもシンプルな文法で習得出来るようになっています。
詳しくは、Riotの公式サイトをご覧ください。

Linearはサーバーレスな一時保存機能を提供します。
HTML5より導入されたlocalStorageを用いて、一時保存を行なっています。

サンプルでは、お気に入り機能を実装していますが、応用すればユーザーの動向を保存させてそれに応じた処理や検索履歴などを表示させることも可能です。

## 2. 依存しているライブラリ

#### jQuery

データの格納時にjQueryが使用されています。
カスタムタグ内にはjQueryは使用されていません。

#### store.js

各種ブラウザ対応のために、[store.js](https://github.com/marcuswestin/store.js/)を使用しています。

#### Riot

ブラウザでコンパイルが行われるRiotの`riot.compiler.min.js`を使用しています。

#### font-awesome

アイコンで使用しています。

## 3. 使用手順

### 準備

`module`ディレクトリと`tags`ディレクトリをサーバーに設置します。
`head`タグ内に以下を追記します。

```html
<!-- import modules -->
	<script src="./module/jquery.min.js" charset="utf-8"></script>
	<script src="./module/store.legacy.min.js" charset="utf-8"></script>
	<script src="./module/riot.compiler.min.js" charset="utf-8"></script>
	<!-- 以下は適宜変更してください -->
	<link rel="stylesheet" href="./css/font-awesome.min.css">
<!-- import modules -->
```

以上で準備は完了です。

### 各種tagの説明

Riotではコンポーネントをtagとして定義します。
tagが一つの機能として分離しているという認識です。

Linearでは以下のように機能を分離しています。

* like.tag：個別ページのお気に入り追加・お気に入り削除・ボタンのレイアウトなどを管理
* likeAll.tag：お気に入り一覧に関する処理を管理。お気に入りの総数、お気に入り一覧からお気に入りを削除などを管理
