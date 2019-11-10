$(function () {
  $('#btn').on('click', function () {
    $.ajax({
      url: "https://hoge",
      dataType: 'json',
    }).done(function (data) {
      var hoge = data.hoge;
      $('#hoge').text(data.hoge);
    }).fail(function (data) {
      alert('読み込めません。');  
    });
  });
});