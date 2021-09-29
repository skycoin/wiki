# Wiki

[**Go to wiki Site >>**](https://skycoin.github.io/wiki/)

This wiki is used to document all of the product and things that happen in the skycoin ecoysystem
and community.

Please keep the folder structure organized. <br>

*Folder Structure*

- **ProjectName**:
    - **devdocs**:  *all documentation for people developing this product*
    - **img**:      *images for the general usage of this project*
    - **setup**:    *holds a setup guide for available operating sytems (one file per os)*
    - **userdocs**: *all documentation for people using this product*



You are always welcomed to **open issues** or **do pull-requests** to suggest improvements or errors on the wiki.

# Setup

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
    You can now change your files and save them, mkdocs will recognize this and rebuild the site locally.

4. Pull-Request your changes
