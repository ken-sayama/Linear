<!-- ****************************************
  ◇ このコンポーネントで管理していること
  - 登録された全てのお気に入りを一覧として表示
***************************************** -->
<likeAll>
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
          <img src={list.image} alt="">
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
  <style scoped>
    :scope {display: block;}

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

    }

    section ul li {
      width: 320px;
      float: left;
      box-sizing: border-box;
      border: 1px solid #ccc;
    }

    section ul li a img {
      width: 100%;
      max-height: 200px;
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
    var lists = []
    store.each(function(value,key){
      var getData = store.get(key)
      lists.push(getData);
    })
    this.lists = lists
    // console.log(this.lists)

    this.removeClick = function(e){
      removeData(e.item.list.id)
      var list = e.item
      var index = this.lists.indexOf(list)
      this.lists.splice(index, 1)
    }

    <!-- ****************************************
      ◇ javascript ロジックを定義
    ***************************************** -->
    // localStorageから値を削除
    function removeData(id){
      store.remove(id)
    }
  </script>

</likeAll>