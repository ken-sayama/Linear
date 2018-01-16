<count>
  <!-- ****************************************
  ◇ HTMLコンポーネント
  ***************************************** -->
  <span>{countNum}</span>

  <script>
    // 一覧の総数をカウント
    var num = []
    store.each(function(value,key){
      if(key == value.id){
        num.push(key)
      }
    })
    this.countNum = num.length

    // マイナスがある場合に総数から-1する
    var that = this
    obs.on('countMinus', function(id){
      var listNum = num.indexOf(String(id))
      num.splice(listNum,1)
      that.countNum = that.countNum - 1
      that.update()
    })

    // マイナスがある場合に総数から+1する
    obs.on('countPlus', function(id){
      var listNum = num.indexOf(String(id))
      num.splice(listNum,1)
      that.countNum = that.countNum + 1
      that.update()
    })
  </script>
</count>
