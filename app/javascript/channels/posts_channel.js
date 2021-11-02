import consumer from "./consumer"

document.addEventListener("turbolinks:load", function () {
  const postsList = document.getElementById("posts-list");
  console.log(postsList);


  consumer.subscriptions.create("PostsChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to posts channel.");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      this.prependPost(data);
    },

    prependPost(data) {
      const newPost = this.createBox(data)
      postsList.insertAdjacentHTML("afterbegin", newPost)
    },

    createBox(data) {
      return `
        <div class="box" id="${data["post"]["id"]}">
          <div id="${data["user"]["username"]}">
            <article class="media">
              <div class="media-content">
                <div class="content">
                  <strong>${data["user"]["name"]}</strong><br>
                  <small>${data["user"]["username"]}</small><br>
                  <small>${data["post"]["created_at"]}</small><br>
                  <p>${data["post"]["body"]}</p>
                </div>
              </div>
            </article>
          </div>
        </div>
      `
    }
  });
});
