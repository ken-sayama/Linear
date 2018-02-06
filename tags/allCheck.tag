<allCheck>
  <!-- ****************************************
    ◇ HTMLコンポーネント
  ***************************************** -->
  <div hide={isZero} onclick={allCheck}>{isAllChecked ? '全てのチェックを外す' : '全てにチェックをする'}</div>

  <!-- ****************************************
    ◇ このファイル内でのみ適用されるスタイル
  ***************************************** -->
  <style>
    div {
      width: 200px;
      border: 1px solid #ccc;
      border-radius: 50px;
      padding: 5px 15px;
      text-align: center;
      cursor: pointer;
    }
  </style>

  <!-- ****************************************
    ◇ javascriptロジック
  ***************************************** -->
  <script>
    // 変数
    this.isAllChecked = false //チェック状態を保持する変数。初期状態はfalseに設定

    this.allCheck = function(){
      if (this.isAllChecked == false) {
        this.isAllChecked = true
      } else {
        this.isAllChecked = false
      }
      obs.trigger('checkAllToLists', this.isAllChecked)
    }


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
</allCheck>
