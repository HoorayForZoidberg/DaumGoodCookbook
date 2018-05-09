function recipeSearch(term){
  const client = algoliasearch(ENV["ALGOLIA_APPLICATION_ID"], ENV["ALGOLIA_SEARCH_ONLY_API_KEY"]);
  const index = client.initIndex('Recipe');
  index.search('gloob', { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      console.log(content);
      return content;
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
}

