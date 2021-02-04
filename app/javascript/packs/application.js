// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
//require("turbolinks").start()
//↑のturbolinksはアプリケーションにおいて、画面遷移を高速化するGemです。
//ページを表示する際に、ページ内の全ての情報を読み込まずに、HTML要素だけを読み込むことで画面遷移を高速化しています。
//turbolinksによって画面遷移は高速化しますが、次ページのHTML要素だけを読み取って表示するため、JavaScriptファイルが読み込まれず、JavaScriptにて設定したイベントが発火しないケースがあります。
//turbolinksは、アプリケーションを作成すると標準で有効になっています。
//JavaScriptファイルの処理が正常に動作しないことを防ぐため、ここではturbolinksを無効化しておきましょう。
require("@rails/activestorage").start()
require("channels")
require("../item_price")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
