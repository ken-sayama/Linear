# Linear

Web上でよく見るお気に入り機能をサーバーレスで実現する事ができます。
Riot.jsでコンポーネントは分割されているので、見た目の変更が容易に可能となっており、またスタイルが外部に影響することはないので、導入時のスタイル崩れを心配する必要がありません。

[demo](https://ken-sayama.github.io/Linear/)


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
HTML5より導入されたlocalStorageを用いて、ブラウザに保存を行なっています。

サンプルでは、お気に入り機能を実装していますが、応用すればユーザーの動向を保存させてそれに応じた処理や検索履歴などを表示させることも可能です。

## 2. 内包しているライブラリ

#### store.js

各種ブラウザ対応のために、[store.js](https://github.com/marcuswestin/store.js/)を使用しています。

#### Riot

ブラウザでコンパイルが行われるRiotの`riot.compiler.min.js`を使用しています。

#### font-awesome

アイコンで使用しています。

## 3. 準備

### 読み込み

`modules`ディレクトリと`tags`ディレクトリをサーバーに設置します。
`head`タグ内に以下を追記します。

```html
<head>
<!-- import modules -->
	<script src="your_path/modules/store.legacy.min.js" charset="utf-8"></script>
	<script src="your_path/modules/riot.compiler.min.js" charset="utf-8"></script>
	<script src="your_path/tags/like.tag" charset="utf-8" type="riot/tag"></script>
	<script src="your_path/tags/likeAll.tag" charset="utf-8" type="riot/tag"></script>
	<script src="your_path/tags/detailLike.tag" charset="utf-8" type="riot/tag"></script>
	<script src="your_path/tags/count.tag" charset="utf-8" type="riot/tag"></script>
	<!-- 以下は適宜変更してください -->
	<link rel="stylesheet" href="./css/font-awesome.min.css">
<!-- import modules -->
</head>
```

bodyタグ直下に`app.js`を読み込みます。

```html
<script src="your_path/modules/app.js" charset="utf-8"></script>
</body>
</html>
```

以上で準備は完了です。

### 各種tagの説明

Riotではコンポーネントをtagとして定義します。
tagが一つの機能として分離しているという認識です。

Linearでは以下のように機能を分離しています。

* like.tag：個別ページのお気に入り追加・お気に入り削除・ボタンのレイアウトなどを管理
* likeAll.tag：お気に入り一覧に関する処理を管理。お気に入りの総数、お気に入り一覧からお気に入りを削除、お気に入り一覧の見た目
* detailLike.tag：トップページなどの簡易な一覧にお気に入り追加、お気に入り削除ボタン、ボタンの見た目について管理しています
* count.tag：お気に入りの総数を管理している。他のタグと連動しており、総数はリアルタイムに変更が行われる

## 4.使用手順

ブログなどがあった場合をテストケースとして説明します。
ブログなどで詳細ページにボタンを設置して、そのページの特定情報をお気に入り機能として使いたい場合、`<like>`