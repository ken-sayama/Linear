<!-- ****************************************
  ◇ このコンポーネントで管理していること
  - 登録された全てのお気に入りを一覧として表示
***************************************** -->
<lists>
  <!-- ****************************************
    ◇ デバッグ
  ***************************************** -->
  <!-- <table>
    <caption>
      お気に入りされたオブジェクト一覧<br>
    </caption>
    <tr>
      <th>プロパティ名</th>
      <th style="border-left: 1px solid #ccc">格納されているデータ</th>
    </tr>
    <tr each={list, i in lists}>
      <p>{list.title}</p>
    </tr>
  </table> -->

  <!-- ****************************************
    ◇ HTMLコンポーネント
  ***************************************** -->
  <section>
    <ul class="clearfix">
      <li each={list, i in lists}>
        <a href={list.url}>
          <img src={list.image} alt="{list.title}">
          <div>id:{list.id}</div>
          <h4>{list.title}</h4>
          <p>給料：{list.salary}</p>
        </a>
        <button onclick={parent.removeClick}>お気に入りから削除</button>
        <!-- <a href="#" onclick={ clickItem.bind(this, list.id) }>{ list.name }</a> -->
      </li>
    </ul>
  </section>

  <!-- ****************************************
    ◇ このファイル内でのみ適用されるスタイル
  ***************************************** -->
  <style>
    .clearfix:after {
      content: '';
      display: block;
      clear: both;
    }

    .clearfix {
      zoom: 1;
    }

    section {
      width: 1000px;
      margin: 0 auto;
    }

    section ul {
      list-style: none;
    }

    section ul li {
      width: 320px;
      float: left;
      box-sizing: border-box;
      border: 1px solid #ccc;
      margin-right: 20px;
      border-radius: 4px;
      background-color: #fff;
      box-shadow: 2px 2px 4px gray;
      height: 340px;
      margin-bottom: 30px;
    }

    section ul li:nth-child(3n){
      margin-right: 0;
    }

    section ul li a img {
      width: 100%;
      max-height: 200px;
    }

    section ul li button {
      color: #fff;
      width: 200px;
      padding: 10px 20px;
      border-radius: 50px;
      background-color: #fc0e49;
      cursor: pointer;
      margin-bottom: 10px;
      border: none;
    }

    section ul li button:hover {
      opacity: 0.7;
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

    strong {
      color: #fc0e49;
    }
  </style>


  <!-- ****************************************
    ◇ javascript ロジックを定義
  ***************************************** -->
  <script>
    /* ----------------------------------------------
     ◇ 変数
    -----------------------------------------------*/
    // localStorageの全ての値を取得し、lists配列に格納
    var lists = []
    store.each(function(value,key){
      var getData = store.get(key)
      if(key == value.id){
        lists.push(getData)
      }
    })
    this.lists = lists

    /* ----------------------------------------------
     ◇ オブザーバブル
    -----------------------------------------------*/
    var that = this
    obs.on('addElement', function(e){
      setData(e)
      var lists = []
      store.each(function(value,key){
        var getData = store.get(key)
        if(key == value.id){
          lists.push(getData)
        }
      })
      that.lists = lists
      that.update()
    })

    obs.on('removeElement', function(e){
      var listNum = 0
      $.each(that.lists,function(i,v){
        if (v.id == e.id){
          num = i
        }
      })
      that.lists.splice(listNum,1)
      that.update()
    })

    /* ----------------------------------------------
     ◇ クリックイベント
    -----------------------------------------------*/
    this.removeClick = function(e){
      var id = e.item.list.id
      var listNum = e.item.i
      removeData(id)
      this.lists.splice(listNum, 1)
      // オブザーバブルの呼び出し
      obs.trigger('countMinus', id)
      obs.trigger('changeDetailLikeBtn')
    }

    /* ----------------------------------------------
     ◇ データ制御
    -----------------------------------------------*/
    // localStorageに値を格納
    function setData(lists){
      store.set(lists.id, lists)
    }

    // localStorageから値を削除
    function removeData(id){
      store.remove(id)
    }
  </script>

</lists>
