#!/bin/bash

PROJECT_DIR=$(pwd)

declare -a CHARTS_ARRAY=("apiRest" "worker" )

for i in "${CHARTS_ARRAY[@]}"
do
    CHART_NAME="$i"
    echo "Building chart: $CHART_NAME"
    mkdir -p releases/$CHART_NAME

    # packaging chart
    helm package charts/$CHART_NAME/
    # Move if not exists
    cp -n $CHART_NAME*.tgz releases/$CHART_NAME

    # Remove all .tgz generated
    rm $PROJECT_DIR/*.tgz

    cd $PROJECT_DIR && helm repo index releases
done

for i in "${CHARTS_ARRAY[@]}"
do
    CHART_NAME="$i"
    echo "Releasing chart: $CHART_NAME"
    sed -i "s/- $CHART_NAME/- releases\/$CHART_NAME/" releases/index.yaml
done

# Move index.yaml to root
mv releases/index.yaml $PROJECT_DIR