#!/bin/bash
set -e

declare -a CHARTS_ARRAY=("apiRest" "worker")

for i in "${CHARTS_ARRAY[@]}"
do
    CHART_NAME="$i"
    echo -e "\n----------------------------"
    echo "Testing chart: $CHART_NAME"
    echo -e "----------------------------\n"

    # Replace false with true to enable all chart features before test
    sed "s/false/true/" charts/$CHART_NAME/values.yaml > charts/$CHART_NAME/test-values.yaml
    helm template new_app_name --debug --v 2 charts/$CHART_NAME --values=charts/$CHART_NAME/test-values.yaml
    rm charts/$CHART_NAME/test-values.yaml

done
