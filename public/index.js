/* global Vue */
/* global axios */

var App = {
  data: function () {
    return {
      message: "Hello from JavaScript!",
      actors: [],
    };
  },
  created: function () {
    this.indexActors();
  },
  methods: {
    indexActors: function () {
      axios.get("http://localhost:3000/actors.json").then((response) => {
        this.actors = response.data;
        console.log("Actors", this.actors);
      });
    },
  },
};

Vue.createApp(App).mount("#app");
