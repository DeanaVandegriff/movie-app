/* global Vue */
/* global axios */

var App = {
  data: function () {
    return {
      message: "Hello from JavaScript!",
      movies: [],
    };
  },
  created: function () {
    this.indexMovies();
  },
  methods: {
    indexMovies: function () {
      axios.get("http://localhost:3000/movies.json").then((response) => {
        this.movies = response.data;
        console.log("Movies", this.movies);
      });
    },
  },
};

Vue.createApp(App).mount("#app");
