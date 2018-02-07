<sendCheck>
  <!-- ****************************************
  ◇ HTMLコンポーネント
  ***************************************** -->
  <a onclick={sendCheck}>求人に一括応募</a>

  <!-- ****************************************
  ◇ このファイル内でのみ有効なスタイルシート
  ***************************************** -->
  <style>
    a {
      width: 200px;
      border: 1px solid #ccc;
      border-radius: 50px;
      padding: 10px 20px;
      box-sizing: border-box;
      display: block;
      text-align: center;
      cursor: pointer;
    }
  </style>

  <!-- ****************************************
  ◇ Javascriptロジック
  ***************************************** -->

  <script>
    /* ----------------------------------------------
     ◇ 変数
    -----------------------------------------------*/
    var type = this.opts.type
    var start_url = "job/data.php?c="
    var mes = 'これらの求人に応募しますか？'

    /* ----------------------------------------------
     ◇ クリックイベント
    -----------------------------------------------*/
    this.sendCheck = function(){
      isTrue(getIds())
    }

    /* ----------------------------------------------
     ◇ チェックがついたidを取得する
    -----------------------------------------------*/
    function getIds(){
      var lists = document.forms.linearForm.list
      var ids = ""
      for (var i = 0; i < lists.length; i++) {
        if (lists[i].checked == true) {
          //ids.push("&item[]=" + lists[i].value)
          ids += "&item[]=" + lists[i].value
        }
      }
      return ids
    }

    /* ----------------------------------------------
     ◇ idsがあれば、リダイレクトを行う
    -----------------------------------------------*/
    function isTrue(ids) {
      if (!ids) {
        alert("対象求人が選択されていません。")
		    return
      }

    	if(window.confirm(mes)){
    		location.href = start_url + type + ids
    	}
    }


  </script>
</sendCheck>
