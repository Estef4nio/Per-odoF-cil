import consumer from "./consumer"

consumer.subscriptions.create({ channel: "NotificationChannel" }, {
  connected() {
    console.log("Connected to NotificationChannel");
  },

  received(data) {
    console.log(`${data.title}: ${data.body}`)
  }
});
