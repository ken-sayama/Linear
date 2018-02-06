<check>
  <input type="checkbox" name="list" value="{this.opts.id}" checked={isTrue}>

  <script>
    var isTrue = false

    var that = this
    obs.on('checkAllToLists', function(isCheck){
      that.isTrue = isCheck
      that.update()
    })
  </script>
</check>
