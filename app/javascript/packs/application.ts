import * as ActiveStorage from "@rails/activestorage";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require("trix");
require("@rails/actiontext");
require("channels");

import MenuHamburger from "src/menu_hamburger";
import FlashDelete from "src/flash_delete";

document.addEventListener("turbolinks:load", () => {
  new MenuHamburger(
    document.querySelector(".navbar-burger") as HTMLElement
  ).initHandlers();

  const flashDeleteButton = document.querySelector(
    ".flash .delete"
  ) as HTMLElement;
  if (flashDeleteButton) new FlashDelete(flashDeleteButton).initHandlers();
});

// https://github.com/turbolinks/turbolinks/issues/430
document.addEventListener("turbolinks:request-start", (event) => {
  const pageNonce = document.querySelector("meta[name='csp-nonce']") as HTMLMetaElement;
  if (pageNonce != null) {
    const xhr = event.data.xhr;
    xhr.setRequestHeader("X-Turbolinks-Nonce", pageNonce.content);
  }
});

document.addEventListener("turbolinks:before-cache", () => {
  const styleTags = document.querySelectorAll("style");
  const scriptTags = document.querySelectorAll("script");
  const pageNonce = document.querySelector("meta[name='csp-nonce']") as HTMLMetaElement;
  if (pageNonce) {
    if (styleTags) {
      styleTags.forEach(tag => { tag.nonce = pageNonce.content; });
    }
    if (scriptTags) {
      scriptTags.forEach(tag => { tag.nonce = pageNonce.content; });
    }
  }
});
