// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

<script>
  // 検索リンクをクリックした時の処理
  document.getElementById("search-link").addEventListener("click", function(event) {
    event.preventDefault();  // デフォルトのクリックイベントを無効化
    document.getElementById("search-bar").style.display = "block";  // 検索バーを表示する
  });

  // 検索ボタンをクリックした時の処理
  document.getElementById("search-button").addEventListener("click", function(event) {
    event.preventDefault();  // デフォルトのクリックイベントを無効化

    var searchValue = document.getElementById("search-input").value;  // 入力された検索値を取得
    // 検索処理（ここでは単純にアラート表示しています）
    alert("検索ボタンがクリックされました。検索値: " + searchValue);
  });
</script>