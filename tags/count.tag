<count>
  <!-- ****************************************
  ◇ HTMLコンポーネント
  ***************************************** -->
  <span>{countNum}</span>

  <script>
    // 一覧の総数をカウント
    var num = []
    store.each(function(value,key){
      num.push(key)
    })
    this.countNum = num.length

    // 一覧のお気に入り削除ボタンが押された時に総数をマイナス1する
    var that = this
    obs.on('countMinus', function(id){
      var listNum = num.indexOf(String(id))
      num.splice(listNum,1)
      that.countNum = that.countNum - 1
      that.update()
    })
  </script>
</count>
