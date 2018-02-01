<noLists>
  <!-- ****************************************
    ◇ HTMLコンポーネント
  ***************************************** -->
  <p show={isZero}>
    お気に入り求人リストに求人が登録されていません。<br>
    求人詳細ページ、求人一覧ページから「お気に入りに追加」ボタンを押してください。
  </p>

  <!-- ****************************************
    ◇ このファイル内でのみ適用されるスタイル
  ***************************************** -->
  <style>
    p {
      color: red;
    }
  </style>

  <!-- ****************************************
    ◇ javascript ロジックを定義
  ***************************************** -->
  <script>
    // 変数
    var num = []

    store.each(function(value,key){
      if (key == value.id) {
        num.push(key)
      }
    })
    this.countNum = num.length

    // もしお気に入りがされていなかったらisZero変数をtrueに
    this.isZero = false
    if(this.countNum == 0){
      this.isZero = true
    }

    // お気に入りリストから削除をされて0になったら表示させる
    var that = this
    obs.on('numMinus', function(id){
      var listNum = num.indexOf(String(id))
      console.log(listNum)
      num.splice(listNum,1)
      that.countNum = that.countNum - 1
      if(that.countNum == 0){
        that.isZero = true
      }
      that.update()
    })
  </script>

</noLists>
