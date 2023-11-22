#!/bin/bash

set -e 

pwd
# List of repositories
repositories=( 
  "./DataXesses/Configurator/ui" \
"./External Databus/Configurator/api" "./External Databus/Configurator/ui"
 )




# Iterate through each repository
for repo in "${repositories[@]}"; do
   

    
    # Navigate into the repository
    cd "$repo"
    echo "in directory $repo ..................."
    echo "stashing the local changes if present.................."
    git stash 
    # # make a branch code-refrac and push to gitlab
    # git checkout develop
    # echo "checkedout develop branch............"

    # git pull origin develop
    # echo "Pulled lastest changes............"

    # git branch code-refrac
    # echo "created  code-refrac branch............"


    # git checkout code-refractoring
    # echo "checked out code-refractoring branch..............."

    cp -r ../../../Scripts .
    echo "Copied Script Files................"

   
    
    python3 ./Scripts/remove_scp_automation.py
    echo "remove scpautomation stage.................."

     ./Scripts/remove_sep.sh
    echo "Removed Seperator........"

    # python3 Scripts/remove_com.py
    # echo "removed commented code ................"

    ./Scripts/add_sep.sh
    echo "added seperator............"

    ./Scripts/replace_file.sh
    echo "replaced gitlab file ............"

    rm modified_gitlab.yml
    rm outputscp-gitlab-ci.yml
    echo "removed modified gitlab file ............"

    rm -rf Scripts
    echo "removed Scripts............"

    git add .gitlab-ci.yml
    git commit -m "updated .gitlab-ci.yml"
    git push origin code-refrac

    echo "code pushed to GITLAB...."
    echo "Successfully executed for $repo"
    # Navigate back to the original directory
    cd ../../../

done
