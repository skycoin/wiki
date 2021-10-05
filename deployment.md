## Deploying the Project

* Checkout to the `main` branch. Make sure you have synchronized the latest changes by running `git pull`. 
* Afterwards build and deploy the wiki to Github Pages by running
  the following command:
    ``` 
    mkdocs gh-deploy
    ```
* MkDocs will build your docs and use the ghp-import tool to commit them to the gh-pages branch and push the gh-pages branch to GitHub.