<allCheck>
  <!-- ****************************************
    ◇ HTMLコンポーネント
  ***************************************** -->
  <div onclick={allCheck}>{isAllChecked ? '全てのチェックを外す' : '全てにチェックをする'}</div>

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

  </script>
</allCheck>
