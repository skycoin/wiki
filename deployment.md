## Deploying the Project

* `checkout` to the branch where you maintain the source documentation for your project
* `git pull` the branch 
* run the following command:
    ``` 
    mkdocs gh-deploy
    ```
* MkDocs will build your docs and use the ghp-import tool to commit them to the gh-pages branch and push the gh-pages branch to GitHub.