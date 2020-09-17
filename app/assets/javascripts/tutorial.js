$(function() {
  $('#tutorial').click(function() {
    introJs()
      .setOptions({
        nextLabel: '次 →',
        prevLabel: '← 前',
        skipLabel: 'スキップ',
        doneLabel: '終了',
        exitOnOverlayClick: false,
        showStepNumbers: false,

        steps: [
        {
          intro:
           '<b>Bookersへようこそ</b><br>簡単にBookersの使い方をご紹介します!',
        },
        {
          element: '#introjs-step1',
          intro: 'タイトルを入力してください',
        },
        {
          element: '#introjs-step2',
          intro: '本文を入力してください',
        },
        {
          element: '#introjs-step3',
          intro: '[投稿]ボタンを押すと本を投稿することができます',
        },
        ],
      })
      .start();
  });
});