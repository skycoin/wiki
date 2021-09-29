# Wiki Setup
1. Clone this repository
2. Install Dependencies 
    +   Install Material for MkDocs with  
        ```
         pip install mkdocs-material 
        ```  

        See also [here](https://squidfunk.github.io/mkdocs-material/getting-started/)  
    +   Install git-revision-date plugin with  
        ```
        pip3 install mkdocs-git-revision-date-plugin
        ```

    +   Install macros-plugin with  
        ```
        pip install mkdocs-macros-plugin
        ```

3. Test your changes with local build
    +   move into folder wiki and start with command 
        ```
        mkdocs serve
        ```
    + Start your browser and go to the displayed IP (e.g. htps://localhost:8000)  
            
    #### **Note**
            You can now change your files and save them,
            mkdocs will recognize this and rebuild the site locally.

4. Pull-Request your changes