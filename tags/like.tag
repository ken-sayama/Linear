<!-- ****************************************
  ◇ このコンポーネントで管理していること
  - ボタンでの追加・削除に関する
  - ボタンに関するHTML・CSS
  - localStorageにデータを格納
  ◇ 用途：詳細ページに設置するボタン
***************************************** -->
<like>

  <!-- ****************************************
    ◇ HTMLコンポーネント
  ***************************************** -->
  <button onclick="{isShow ? addClick : removeClick}"><i class="fa {isShow ? 'fa-star-o' : 'fa-star'}"></i>{isShow ? 'お気に入りに追加' : 'お気に入りから削除'}</button>

  <!-- ****************************************
    ◇ デバッグ時に登録できるオブジェクトを表組みで表示
  ***************************************** -->
  <!-- 登録したオブジェクトの取得確認用要素 デバッグ時にコメントインしてください -->
  <!-- <table>
    <caption>
      登録したオブジェクト一覧<br>
      <p>以下の値がボタンを押した際にstorageに格納されます</p>
    </caption>
    <tr>
      <th>プロパティ名</th>
      <th style="border-left: 1px solid #ccc">格納されているデータ</th>
    </tr>
    <tr each={list, i in lists}>
      <th>{i}</th>
      <td>{list}</td>
    </tr>
  </table> -->

  <!-- ****************************************
    ◇ このファイル内でのみ適用されるスタイル
  ***************************************** -->
  <style>
    button {
      color: #fff;
      width: 200px;
      padding: 10px 20px;
      border-radius: 50px;
      background-color: #fc0e49;
      cursor: pointer;
      margin-bottom: 10px;
      border: none;
    }

    button:hover {
      opacity: 0.7;
    }

    button i {
      margin-right: 10px;
    }

    table {
      margin: 20px auto;
      padding: 15px;
      border: 1px solid #ccc;
      width: 600px;
      box-sizing: border-box;
      border-collapse: collapse;
      border-spacing: 0;
      color: #777;
    }

    table caption {
      margin-bottom: 10px;
    }

    table caption p {
      font-size: 10px;
      text-align: center;
      text-decoration: underline;
    }

    table tr {
      border-bottom: 1px solid #ccc;
    }

    table th {
      background-color: #00897b;
      padding: 10px;
      color: #fff;
      font-weight: normal;
    }

    table td {
      padding: 10px;
    }
  </style>

  <!-- ****************************************
    ◇ javascript ロジックを定義
  ***************************************** -->
  <script>
    /* ----------------------------------------------
     ◇ 変数
    -----------------------------------------------*/
    // likeタグの属性に代入された値をlistsオブジェクトに代入
    this.lists = this.opts

    /* ----------------------------------------------
     ◇ 判定用の変数と処理
    -----------------------------------------------*/
    // ボタン読み込み時にお気に入り登録されているかを判定
    this.isShow = false
    if (store.get(this.lists.id) == undefined){
      this.isShow = true
    }

    /* ----------------------------------------------
     ◇ オブザーバブル
    -----------------------------------------------*/
    var that = this
    obs.on('addDisplay', function(){
      that.isShow = false
      that.update()
    })
    obs.on('removeDisplay', function(){
      that.isShow = true
      that.update()
    })

    /* ----------------------------------------------
     ◇ クリックイベント
    -----------------------------------------------*/
    // 追加クリック時のイベント
    this.addClick = function(){
      setData(this.lists)
      obs.trigger('addDisplay')
      obs.trigger('countPlus', this.lists.id)
    }

    // 削除クリック時のイベント
    this.removeClick = function(){
      removeData(this.lists)
      obs.trigger('removeDisplay')
      obs.trigger('countMinus', this.lists.id)
    }

    /* ----------------------------------------------
     ◇ データ制御
    -----------------------------------------------*/
    // localStorageに値を格納
    function setData(lists){
      store.set(lists.id, lists)
    }

    // localStorageから値を削除
    function removeData(lists){
      store.remove(lists.id)
    }
  </script>
</like>
