<check>
  <input ref="chk" type="checkbox" name="list" value="{this.opts.id}" checked={isTrue} onclick={check}>

  <script>
    this.isTrue = false

    this.check = function(){
      if (this.isTrue == false) {
        this.isTrue = true
      } else {
        this.isTrue = false
      }
    }


    var that = this
    obs.on('checkAllToLists', function(isCheck){
      that.isTrue = isCheck
      that.update()
    })
  </script>
</check>
