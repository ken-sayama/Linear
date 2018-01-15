// タグの連動
var obs = riot.observable();

$(function(){
  $('detailLike').click(function(){
    var p = $(this).parent();
    var url = p.children('h3').children('a').attr('href');
    var id = url.match(".+/(.+?)\.[a-z]+([\?#;].*)?$");
    var objects = {
      id: id[1],
      url: url,
      title: p.children('h3').children('a').text(),
      image: p.children('.photo').children('a').children('img').attr('src'),
      salary: p.find('.salary').text(),
      location: p.children('.access').children('dl').children('dd').text(),
      jobCategory: p.find('.jobCategory').text(),
      jobStatus: p.find('.jobStatus').text()
    }
    // riot.mount('detailLike',objects);
  });
  riot.mount('detailLike',objects);
});
riot.mount('*');
