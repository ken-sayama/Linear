riot.tag2('detaillike', '<button onclick="{add.parent}">お気に入りに追加</button>', 'button { color: #fff; width: 200px; padding: 10px 20px; border-radius: 50px; background-color: #fc0e49; cursor: pointer; margin-bottom: 10px; } button:hover { opacity: 0.7; } button i { margin-right: 10px; } table { margin: 20px auto; padding: 15px; border: 1px solid #ccc; width: 600px; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; color: #777; } table caption { margin-bottom: 10px; } table caption p { font-size: 10px; text-align: center; text-decoration: underline; } table tr { border-bottom: 1px solid #ccc; } table th { background-color: #00897b; padding: 10px; color: #fff; font-weight: normal; } table td { padding: 10px; }', '', function(opts) {
    this.add = function(e){
      console.log(e.currentTarget)
    }.bind(this)
});
